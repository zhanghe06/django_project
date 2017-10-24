from django.test import TestCase

# Create your tests here.

from .models import User
from django.urls import reverse

test_user_data = [
    {'id': 1,
     'status_activate': 1,
     'time_activate': '2017-01-12 11:01:05+00:00',
     'time_create': '2017-01-11 11:01:05+00:00',
     'time_update': '2017-01-11 11:01:05+00:00'},
    {'id': 2,
     'status_activate': 1,
     'time_activate': '2017-02-12 11:01:05+00:00',
     'time_create': '2017-02-11 11:01:05+00:00',
     'time_update': '2017-02-11 11:01:05+00:00'},
    {'id': 3,
     'status_activate': 1,
     'time_activate': '2017-03-12 11:01:05+00:00',
     'time_create': '2017-03-11 11:01:05+00:00',
     'time_update': '2017-03-11 11:01:05+00:00'},
    {'id': 4,
     'status_activate': 1,
     'time_activate': '2017-04-12 11:01:05+00:00',
     'time_create': '2017-04-11 11:01:05+00:00',
     'time_update': '2017-04-11 11:01:05+00:00'},
    {'id': 5,
     'status_activate': 1,
     'time_activate': '2017-05-12 11:01:05+00:00',
     'time_create': '2017-05-11 11:01:05+00:00',
     'time_update': '2017-05-11 11:01:05+00:00'},
]

test_extract_data = {'status_lock': 0, 'status_real_name': 0, 'status_delete': 0}


class UserIndexViewTests(TestCase):

    def setUp(self):
        super(UserIndexViewTests, self).setUp()

        for index, user_item in enumerate(test_user_data):
            user_item.update(test_extract_data)
            user = User(**user_item)
            user.save()
            self.assertEqual(user.id, index + 1)

    def test_user_index(self):
        """
        test user index
        """
        response = self.client.get(reverse('user:index'))
        self.assertEqual(response.status_code, 200)


class UserIndexModelTests(TestCase):

    def setUp(self):
        super(UserIndexModelTests, self).setUp()

        for index, user_item in enumerate(test_user_data):
            user_item.update(test_extract_data)
            user = User(**user_item)
            user.save()
            self.assertEqual(user.id, index + 1)

    def test_user_index(self):
        """
        test user index
        """
        latest_user_list = User.objects.order_by('-time_create')
        self.assertEqual(len(latest_user_list), len(test_user_data))
