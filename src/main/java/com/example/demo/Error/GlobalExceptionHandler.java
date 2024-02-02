// package com.example.demo.Error;

// import org.springframework.http.HttpStatus;
// import org.springframework.web.bind.annotation.ControllerAdvice;
// import org.springframework.web.bind.annotation.ExceptionHandler;
// import org.springframework.web.bind.annotation.ResponseStatus;
// import org.springframework.web.servlet.NoHandlerFoundException;

// @ControllerAdvice // 모든 컨트롤러에 적용되는 전역적인 예외 처리를 담당하는 클래스를 의미
// public class GlobalExceptionHandler {

// @ExceptionHandler(Exception.class)
// @ResponseStatus(org.springframework.http.HttpStatus.INTERNAL_SERVER_ERROR) // 500에러 발생 시 동작하는 어노테이션
// public String handle500Error(Exception e) {
// return "error500";
// }

// @ExceptionHandler(NoHandlerFoundException.class)
// @ResponseStatus(HttpStatus.NOT_FOUND) // 404에러 발생 시 동작하는 어노테이션
// public String handle404Error(NoHandlerFoundException e) {
// return "error404";
// }

// }
