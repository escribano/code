{_} = require '../lib/i18nHelpers'

exports.titles =
  defaultDashboardPage: _("Dashboard Page")
  defaultRegistrationPage: _("Register for Your Account")
  redisErrorUsername: _("Registration Page Set Username - Redis Error")
  redisErrorEmail: _("Registration Page Set Email - Redis Error")
  redisErrorSetVerify: _("Set Verification State - Redis Error")
  redisErrorSetUnique: _("Set Unique Link - Redis Error")
  emailErrorSend: _("Error Sending Email - SMTP Error")
  successRegistrationPage: _("Registration Page - Success")

exports.errors =
  redisErrorPrefix: _("Redis error: ")
  unconfirmedAccount: _("You have not verified your account. Check your email.")
  usernameDoesNotExist: _("Username does not exist.")
  incorrectPassword: _("Incorrect Password.")
  usernameExists: _("Username exists.")
  emailExists: _("Email address exists.")
