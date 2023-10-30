from django.db import models


class Client(models.Model):
    client_id = models.AutoField(primary_key=True)
    client_name = models.CharField(max_length=100, null=True, blank=True)
    client_description = models.CharField(max_length=250, null=True, blank=True)

    def __str__(self):
        return f'{self.client_name} - {self.client_description}'
