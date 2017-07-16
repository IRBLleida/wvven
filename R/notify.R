# Wrong Variable Value Email Notification
#
# This function sends a notification email via SendGrid v3 web API.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

notify <- function(patient, variable, value, email, comments) {
    library(httr)

    email_template = paste('<dl><dt>ID pacient</dt><dd>', patient, '</dd><dt>Variable</dt><dd>', variable, '</dd><dt>Valor</dt><dd>', value, '</dd></dl><p>', comments, '</p>')

    sendgrid_key <- Sys.getenv('SENDGRID_KEY')
    if (identical(sendgrid_key, "")) {
        stop("No s'ha trobat la variable d'entorn SENDGRID_KEY. Afegeix-la a l'arxiu .Renviron al directori home del teu usuari.",
             call. = FALSE)
    }

    sendgrid_template <- Sys.getenv('SENDGRID_TEMPLATE')
    if (identical(sendgrid_template, "")) {
        stop("No s'ha trobat la variable d'entorn SENDGRID_TEMPLATE Afegeix-la a l'arxiu .Renviron al directori home del teu usuari.",
             call. = FALSE)
    }

    data = paste('{
        "personalizations": [
            {
                "to": [
                    {
                        "email": "', email, '"
                    }
                ],
                "subject": "[UBiostat] - Avís de valor de variable incorrecte",
                "substitutions": {}
            }
        ],
        "from": {
            "email": "no-reply@irblleida.cat"
        },
        "template_id": "', sendgrid_template, '",
        "content": [
            {
                "type": "text/html",
                "value": "', email_template , '"
            }
        ]
    }')

    res <- POST(
        "https://api.sendgrid.com/v3/mail/send",
        accept_json(),
        add_headers(
            "Authorization" = paste("Bearer ", sendgrid_key),
            "Content-Type" = "application/json"),
        body = data)
}
