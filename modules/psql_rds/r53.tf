# // This resource optionally create when provide route53 zone id
resource "aws_route53_record" "this" {
  zone_id = data.aws_route53_zone.selected.id
  name    = "${local.name_env}-psql-rds.${data.aws_route53_zone.selected.name}"
  type    = "CNAME"
  ttl     = "5"
  records = [aws_rds_cluster.this.endpoint]
}
