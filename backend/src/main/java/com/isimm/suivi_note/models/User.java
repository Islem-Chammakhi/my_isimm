package com.isimm.suivi_note.models;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.experimental.SuperBuilder;

@Entity
@DiscriminatorColumn(name="role", discriminatorType = DiscriminatorType.STRING)
@Inheritance(strategy = InheritanceType.SINGLE_TABLE) // Because number of columns in t_users + sub classes is small. => Better than JOIN
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@SuperBuilder
@Table(name = "t_user")
public class User  implements UserDetails {
    
    @Id
    private String cin ;

    @NotBlank(message = "firstName is missing")
    private String firstName; 

    @NotBlank(message = "lastName is missing")
    private String lastName; 

    @NotBlank(message = "email is missing")
    @Email(message = " invalid email")
    @Column(unique = true, nullable = false)
    private String email;

    @NotBlank(message = "password is missing")
    private String password;

    private String otp;

    private LocalDateTime otpExpiry;
/*  DiscriminatorColumn makes this obsolete
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role;*/

    @Transient
    public String getRole(){
        return getClass().getAnnotation(DiscriminatorValue.class).value();
    }

    @Override
    //TODO: Test this. Make sure no kaboom happens
    public Collection<? extends GrantedAuthority> getAuthorities() {
       return List.of(new SimpleGrantedAuthority("ROLE_" + getClass().getAnnotation(DiscriminatorValue.class).value()));
    }

    @Override
    public String getPassword() { return this.password; }

    @Override
    public String getUsername() {
        return this.cin;
    }

    @Override
    public boolean isAccountNonExpired() { return true; }

    @Override
    public boolean isAccountNonLocked() { return true; }

    @Override
    public boolean isCredentialsNonExpired() { return true; }

    @Override
    public boolean isEnabled() { return true; }

}
