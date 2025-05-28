locals {
  scheduler_jobs = {
    for combo in flatten([
      for job_key, job in var.base_jobs : [
        for suf, user in var.users : {
          key         = "${job.name_prefix}${suf}"
          name        = "${job.name_prefix}${suf}"
          schedule    = job.schedule
          description = job.description
          rut         = user.rut
          password    = user.password
        }
      ]
    ]) : combo.key => combo
  }
}
