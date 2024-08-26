# Ruby [partner-api.1c.ru](https://partner-api.1c.ru/api/swagger-ui/index.html)
[![Build Status](https://github.com/sorokinltd/partners-api-portal-1c-ruby/workflows/CI/badge.svg)](https://github.com/Suban05/enjoyWord/actions)

## Usage

* Get your login and password from https://portal.1c.ru/partner/faq

## Quickstart

```rb
require 'portal_1c'

portal1c = Portal1C::Client.new('login', 'password')
```

## Examples

### subscription-rest-controller

#### Check contract by regnum

```rb
regnums = [801895194, 202680616, 8029772]
result = portal1c.check_its_by_reg_num(regnums)
```

#### Check contract by subscriber code

```rb
codes = %w[CL-12382 CL-898382 CL-932992]
result = portal1c.check_its_by_subscriber_code(codes)
```

#### Check contract by login

```rb
logins = ['foobar@example.com', 'foo@example.com', 'bar@example.com']
result = portal1c.check_its_by_login(logins)
```

### subscriber-rest-controller

#### Get subscribers list

```rb
result = portal1c.subscriber(page: 0, size: 1)
```

### option-rest-controller

#### Billing report

```rb
codes = %w[CL-12382 CL-898382 CL-932992]
billing_report = portal1c.billing_report(type: 'CLOUD_BACKUP', subscriber_code_list: codes)
report_id = billing_report['reportUeid']
result = portal1c.get_billing_report(report_id)
```

### industry-rest-controller

#### Check industry by subscriber code

```rb
codes = %w[CL-12382 CL-898382 CL-932992]
result = portal1c.check_industry_by_subscriber_code(codes)
```

#### Check industry by regnum

```rb
regnums = [801895194, 202680616, 8029772]
result = portal1c.check_industry_by_reg_num(regnums)
```

#### Check industry by login

```rb
logins = ['foobar@example.com', 'foo@example.com', 'bar@example.com']
result = portal1c.check_industry_by_login(logins)
```

### program-version-rest-controller

#### Programs

```rb
result = portal1c.programs
```

#### Program versions

```rb
result = portal1c.program_versions(cursor: 0, nick: 'CRM')
```

### nomenclature-rest-controller

```rb
regnums = [801895194, 202680616, 8029772]
result = portal1c.get_nomencluture_by_reg_numbers(regnums)
```

### client-program-access-controller

#### Client program access by regnum

```rb
regnums = [801895194, 202680616, 8029772]
result = portal1c.client_program_access_by_reg_number(regnums)
```

#### Client program access by login

```rb
regnums = [801895194, 202680616, 8029772]
result = portal1c.client_program_access_by_login(login: 'login')
```
