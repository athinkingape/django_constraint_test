from django.db import models

class Example(models.Model):
    idx_second = models.IntegerField(null=False)
    idx_third = models.IntegerField(null=False)
    other = models.IntegerField(null=True)
    idx_first = models.IntegerField(null=False)

    class Meta:
        unique_together = (
        )
