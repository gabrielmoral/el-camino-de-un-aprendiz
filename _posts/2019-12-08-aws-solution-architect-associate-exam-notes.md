---
layout: post
title: 'AWS Solution Architect Associate Exam Notes'
date: 2019-12-08 09:00:00.000000000 +01:00
type: post
published: true 
status: published
categories:
- Certification
- Cloud
- Learning
language: en
---

Last week I was able to pass the AWS Solution Architect Associate exam certification and I would like to share the process I followed to prepare the exam.

I decided to prepare the exam when my company [Ding](http://www.ding.com) asked me if I would like to attend a course in Amazon offices about Architecting on AWS. Before attending the course I had no idea about what cloud services AWS offered, I knew only about EC2 and Lambda so yes I learnt a lot during the 5 days. Thanks to Ding for the opportunity. 

As Sandro Mancuso mentions in his book, we the developers should own the learning path for ourselves. For that reason, I committed to knowing more about what AWS provides and how it can help developers to build products.

I started for signing up in a learning platform called [A Cloud Guru](https://acloud.guru/) where it provides several courses to prepare different cloud vendor certifications. I liked the way the course is structured. The best part is they encourage you to practice a lot with the AWS console and some of the lessons are purely practical which is very good. They also have an exam simulator where you can practice and prepare for the exam.

After finishing the course I continued reading a few AWS whitepapers:
- [AWS Well-Architected Framework](https://d1.awsstatic.com/whitepapers/architecture/AWS_Well-Architected_Framework.pdf)
- [AWS Cloud Best Practices](https://d1.awsstatic.com/whitepapers/AWS_Cloud_Best_Practices.pdf)
- [AWS Serverless Multi-Tier Architectures](https://d1.awsstatic.com/whitepapers/AWS_Serverless_Multi-Tier_Architectures.pdf)

From the multiple AWS cloud services, I would say that the most relevant for the exam are **S3**, **EC2**, **RDB**, **DynamoDB**, **ELB**, **EBS** and **VPC**. Reading the FAQ for these services will give you an overview of the purpose of the services and how they work.

Another important point is that you should be able to create from scratch a VPC with Subnets, Internet Gateways, NAT instances / NAT Gateways and Route tables. That is only possible with practice with the AWS Console or the AWS CLI.

During the almost two months of preparation, I took some notes to study the multiple services. The notes are mostly extracted from A Cloud Guru platform and the FAQ of each service:
[AWS Solution Architect Associate Exam Notes](https://github.com/gabrielmoral/aws-solution-architect-associate-exam-notes)

I imagine the notes will get obsolete at some point since AWS changes very fast the services in the platform, although the fundamentals should not change too much.

As my final advise, do not focus just on getting the certification done. For me, it was much more rewarding the travel through the path of learning than the actual certification.