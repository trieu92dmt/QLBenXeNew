/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qlbx.handlers.LoginSuccessfullHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author ASUS
 */
@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.qlbx.repository",
    "com.qlbx.service"
})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private AuthenticationSuccessHandler loginSuccessHandler;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers("/").permitAll().and()
                .formLogin().loginPage("/user-login")
                .defaultSuccessUrl("/")
                .failureUrl("/login?error")
                .usernameParameter("username")
                .passwordParameter("password").and()
                .logout().logoutUrl("/user-logout").logoutSuccessUrl("/login");
        http.formLogin().successHandler(this.loginSuccessHandler);
        http.authorizeRequests().antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
                .and().exceptionHandling().accessDeniedPage("/error");
        http.authorizeRequests().antMatchers("/companyMn/**").access("hasRole('ROLE_COMPANY')")
                .and().exceptionHandling().accessDeniedPage("/");
        http.csrf().disable();
    }

    @Bean
    public AuthenticationSuccessHandler loginSuccessHandler(){
        return new LoginSuccessfullHandler();
    }
                @Bean
        public Cloudinary cloudinary() {
            Cloudinary cloudinary
                    = new Cloudinary(ObjectUtils.asMap(
                            "cloud_name", "minhtrieu-cloudinary",
                            "api_key", "568465589926894",
                            "api_secret", "abhM0GqLGiZf2OuZM4qaP4-nqPw",
                            "secure", true));
            return cloudinary;
        }
}
