from django.db import models

class Person(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    lastname = models.CharField(max_length=100)
    birth_date = models.DateField()
    

class ArmyDelay(models.Model):
    person_id = models.ForeignKey(Person , on_delete=models.CASCADE)
    delay_until = models.DateField(null=True)
    