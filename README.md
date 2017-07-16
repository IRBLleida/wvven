# wvven
Wrong Variable Value Email Notification


## Install

The `devtools` package is needed to install it directly from GitHub.

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

## Usage

```
notify("PATIENT_ID", "VARIABLE", "WRONG VALUE", "RECEIVER_EMAIL@SOMETHING.TEST", "ADDITIONAL COMMENTS.")
```
