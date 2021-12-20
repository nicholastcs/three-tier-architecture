resource "aws_iam_instance_profile" "this" {
  name = "${local.name_env}-ec2-profile"
  role = aws_iam_role.this.name
}

resource "aws_iam_role_policy_attachment" "this" {
  count = 3

  role = aws_iam_role.this.name
  policy_arn = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  ][count.index]
}

resource "aws_iam_role_policy" "this" {
  name   = "${local.name_env}-ec2-inline-policy"
  role   = aws_iam_role.this.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
          "ssm:GetParameter"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "this" {
  name = "${local.name_env}-ec2-role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}
