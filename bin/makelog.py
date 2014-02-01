#!/usr/bin/env python

from time import strftime, localtime
from string import Template

# TODO:
# * make this include TODO_TOMORROW.md if it exists, as a way to roll tasks from the previous day into today's new log.


s = """Title: Daily Log for $dow $date  
Author: Shane Landrum   
Date: $date  
Base Header Level: 2  

# To do today
* 

# Today's time-use plan:
*

# Accomplished today:
* 

# Body & Brain:
* Sleep:
* Food: 
* Medications: 
* Exercise:
    * Yoga:
    * Meditation:
    * Misc: 

# End-of-day Metacognition:

## What worked today?
*

## Current challenges? 
*

## Plans for tomorrow? 
*

## What can I do to make tomorrow easier on myself?
*

## What new points have I found about the big picture?
* 

## What have I decided not to chase for now?
* 

"""


t=Template(s)

print t.substitute(dow=strftime("%a", localtime()), 
										date=strftime("%B %d, %Y", localtime()))
