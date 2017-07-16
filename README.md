# wvven
The Wrong Variable Value Email Notification package is an interface to send emails via [SendGrid](https://sendgrid.com/).

The goal of the package is to provide an easy and clean way to send a notification email alerting the responsible of the dataset of a wrong value in a patient's variable.

This package uses Sendgrid's template system to send a styled email, and therefore you will need to provide both an API key to authenticate with SendGrid an a template ID.


## Installation

The `devtools` package is needed to install this package directly from GitHub.

```
library(devtools)
install_github("IRBLleida/wvven")
```

The `wvven` package requires two envirnment variables to be defined:

 - SENDGRID_KEY: The API key to send emails via SendGrid v3 web API.
 - SENDGRID_TEMPLATE: The ID of the SendGrid template that will be used.

You should have a `.Renviron` file in your home directory that looks like:

```
SENDGRID_KEY=<API_KEY>
SENDGRID_TEMPLATE=<TEMPALTE_ID>
```

To find your home path you can execute the following R script:

```
normalizePath("~/")
```

To create the `.Renviron` file directly from R (replacing `YOUR-API-KEY` and `TEMPLATE-ID` for the real values):

```
cat("SENDGRID_KEY=YOUR-API-KEY\nSENDGRID_TEMPLATE=TEMPLATE-ID",
    file=file.path(normalizePath("~/"), ".Renviron"),
    append=TRUE)
```

## Usage
There is only one function, `notify()`, which will send the notification email.

```
library(wvven)
notify("PATIENT_ID", "VARIABLE", "WRONG VALUE", "RECEIVER_EMAIL@SOMETHING.TEST", "ADDITIONAL COMMENTS.")
```

### Parameters
Five parameters should be provided to the `notify()` function:
 - *PATIENT*: The identifier of the patient.
 - *VARIABLE*: The variable that has an incorrect value.
 - *VALUE*: The current incorrect value of the patient's variable.
 - *EMAIL*: The email address of the person that will be notified (usually the provider of the dataset).
 - *COMMENTS*: Any additional comments that should be included in the notification email.

### Sample email result
This is how a sample email looks like:
![Sample email result](http://i.imgur.com/jVtHR7w.png)

## Meta
- Please report [any issues or bugs](https://github.com/IRBLleida/wvven/issues).
- License: MIT
