/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.validator;

import com.qlbx.pojo.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author ASUS
 */
@Component
public class PasswordValidator implements Validator{

    @Override
    public boolean supports(Class<?> type) {
        return User.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;
        String pattern = "^(?=.*[A-Za-z])(?=.*?[0-9])[a-zA-Z0-9]*$";
        String pass = user.getPassword();
        if (pass.length() < 8)
            errors.rejectValue("password", "password.size.minErr");
        else if (pass.contains(" "))
            errors.rejectValue("password", "password.whiteSpaceErr");
        else if (!pass.matches(pattern))
            errors.rejectValue("password", "password.specialCharErr");
        else if (!user.getConfirmPassword().equals(pass)){
            errors.rejectValue("confirmPassword", "password.confirmPasswordErr");
        }
    }
    
}
