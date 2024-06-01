resource "aws_acm_certificate" "main" {
  domain_name       = "aiperirus.com"
  subject_alternative_names = [ "*.aiperirus.com" ]
  validation_method = "DNS"

  tags =  merge (
       { Name = replace(local.name, "rtype", "acm")} ,
        local.common_tags
    )

  lifecycle {
    create_before_destroy = true
  }
}

# output "test" {
#   value = aws_acm_certificate.main.domain_validation_options
# }


resource "aws_route53_record" "validation_record" {
  for_each = {
    for dvo in aws_acm_certificate.main.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.zone_id
}

resource "aws_acm_certificate_validation" "main" {
  certificate_arn         = aws_acm_certificate.main.arn
  validation_record_fqdns = [for record in aws_route53_record.validation_record : record.fqdn]
}

# output "test2" {
#   value = aws_route53_record.validation_record
# }

resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "aiperirus.com"
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }
}

