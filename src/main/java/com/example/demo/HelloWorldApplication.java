package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class HelloWorldApplication {

	// La méthode main lance le serveur web intégré (généralement Tomcat)
	public static void main(String[] args) {
		SpringApplication.run(HelloWorldApplication.class, args);
	}

	// Cette annotation indique que les requêtes HTTP GET sur la racine ("/")
	// déclencheront cette méthode
	@GetMapping("/")
	public String hello() {
		return "Hello World";
	}
}
