import random


num_people_in_room = 4			#Change This Number

#Simulate a room with a certain number of people
def simulate(num_people):
  birthdays = []
  print("Here's what our room looks like:\n")
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	#Assign a random birthday to each person
  for i in range(0, num_people):
    #Choose a random month
    month_choice = random.choice(months)
    #Choose a random day based on month
    if month_choice == "February":
      day = random.randint(1, 29)
    elif month_choice == "April" or month_choice == "June" or month_choice == "September" or month_choice == "November":
      day = random.randint(1, 30)
    else:
      day = random.randint(1, 31)
    birthday = month_choice + " " + str(day)
    #Store the birthday
    birthdays.append(birthday)
    print("Person {0}'s birthday: {1}".format(i + 1, birthday))
  calculate_probability(num_people)
  match = False
  #Check for matching birthdays
  for i in range(len(birthdays)):
    if find_duplicates(birthdays, birthdays[i], i):
      match = True
      break
  if not match:
    print("\n\nIn our simulation, no two people have the same birthday")

#Calculate the probability of there being 2 people with the same birthday
def calculate_probability(num_people):
  #Check there is at least 2 people in the room
  if num_people < 2:
    print("\n\nNot enough people in the room!")
    return
  else:
    #Calculate the probability
    numerator = 365
    countdown = 364
    for i in range(2, num_people + 1):
      numerator = numerator * countdown
      countdown -= 1
    denominator = 365 ** num_people
    probability = 1 - numerator/float(denominator)
    #Change probability to percentage
    rounded = round(probability*100, 2)
    print("\n\nThe probability that two people in a room of {0} people have the same birthday is nearly {1}%".format(num_people, rounded))

    
#Find the same birthday within our list of birthdays
def find_duplicates(birthdays_list, birthday, index):
  people = []
  for i in range(len(birthdays_list)):
    if birthdays_list[i] == birthday and i != index:
      people.append(i + 1)
  if people:
    people.append(index + 1)
    print("\n\nIn our simulation, the following people have the same birthdays: ")
    for person in people:
      print("Person {0}".format(person))
    return True
  else:
    return False

simulate(num_people_in_room)
  
"""
==================
K-means Clustering
==================

The plot displays what a K-means algorithm would yield.
"""

import codecademylib3_seaborn
import matplotlib.pyplot as plt
import numpy as np 

from os.path import join, dirname, abspath
from mpl_toolkits.mplot3d import Axes3D

from sklearn.cluster import KMeans
from sklearn import datasets

iris = datasets.load_iris()

x = iris.data
y = iris.target

fignum = 1

# Plot the ground truthd

fig = plt.figure(fignum, figsize=(4, 3))

ax = Axes3D(fig, rect=[0, 0, .95, 1], elev=48, azim=134)

for name, label in [('Zombies', 0),
                    ('Programmers', 1),
                    ('Vampires', 2)]:
    ax.text3D(x[y == label, 3].mean(),
              x[y == label, 0].mean(),
              x[y == label, 2].mean() + 2, name,
              horizontalalignment='center',
              bbox=dict(alpha=.2, edgecolor='w', facecolor='w'))

# Reorder the labels to have colors matching the cluster results

y = np.choose(y, [1, 2, 0]).astype(np.float)
ax.scatter(x[:, 3], x[:, 0], x[:, 2], c=y, edgecolor='k')

ax.w_xaxis.set_ticklabels([])
ax.w_yaxis.set_ticklabels([])
ax.w_zaxis.set_ticklabels([])

ax.set_xlabel('hates sunlight')
ax.set_ylabel('likes garlic')
ax.set_zlabel('canine teeth (in)')

ax.set_title('')
ax.dist = 12

#ADD CODE HERE
plt.show()
