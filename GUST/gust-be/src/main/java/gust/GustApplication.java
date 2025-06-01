package gust;

import io.swagger.v3.oas.annotations.ExternalDocumentation;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@OpenAPIDefinition(
        info = @Info(
                title = "Sugar Break API",
                version = "v1",
                description = "The 'Sugar Break' API provides a comprehensive platform " +
                        "for users seeking to reduce or eliminate sugar from their diet. " +
                        "It offers features such as daily tracking, sugar substitution recommendations, " +
                        "habit formation tools, and personalized challenges to make the journey " +
                        "of giving up sugar more manageable and effective."
        ),
        externalDocs = @ExternalDocumentation(
                description = "API Repository",
                url = "https://github.com/Barik99/SugarBreak.git"
        )
)
@SpringBootApplication
public class GustApplication {

    public static void main(String[] args) {
        SpringApplication.run(GustApplication.class, args);
    }
}