# Proposal

## Team Members

Francisco Flores, Pamela Needle

## Project proposal

Idea #1:
Using tensor flow algorithm in conjunction with google images API for a reverse image search. Given the Google maps API and street view pictures return where a picture/snapshot is likely from with a percentage probability.

Limitation: Tensor flow can’t detect proper nouns, which would most accurately lead to a location determination (i.e. Eiffel Tower, Big Ben, etc.).
Solution: Use OverFeat https://github.com/sermanet/OverFeat for object localization (apparently more accurate for object localization)

Approach:

Use these image localization algorithms to basically reverse image search a street view picture using google maps API, Overfeat can input an image, and return a prediction output, as well as groundtruth labels. It can be used on simpler or larger datasets made from the images, using either localization or data detection, respectively, to perform these actions. The returned data from data detection, instead of returning the centrally focused object in the image, returns a table of all objects detected in the image. This can be used to predict the location of a given snapshot/picture, which can be applied to many different scenarios, such as social media picture location suggestion, forensics, or even marketing, as a unique feature in a specific restaurant/city could generate more recognition over these platforms, thereby generating revenue.


Idea #2:
Scraping the website 1001tracklist.com for music information

Approach:
1001tracklist is currently the strongest tool that is used to log all performance details of most artists in the electronic music industry. In the Electronic Music Industry, Miami Music Week (March 21-26) is the most important week for these record labels in terms of artist exposure. 1001tracklist currently has an up-to-date archive of all performance details of all electronic music DJs performances, mainly a tracklisting of each performance. Our goal would be to scrape this website of all of its information relating to miami music week, create a cleaned data-set from these findings to be able to:
	Find the most played song by all artists from the week
	Find the artist who played the most unique performances (Based on song popularity/comparing to other performances of same artist)
	Find the artist who played the most unreleased music
	Most played artist by all artists




Idea #3:
https://www.yelp.com/dataset_challenge
https://snap.stanford.edu/data/web-Amazon.html
4.1: Scrape the twitter (or any other social media outlet) api to attempt to see if we could predict the ratings of a restaurant using keywords and location that would lead us to the conclusion that they are speaking either highly or badly of the given location
4.2: Determine if there is a confirmation bias within the ratings/reviews system. If the location is rated badly, is it more likely that the following reviews will follow this trend? (Could also be applied to amazon reviews)
4.3: Determine if the reviews are a robot. Fake reviews are very common on rating platforms like yelp or amazon, in an attempt to persuade customers for their business. Is there a way to determine if a review is genuine?

Idea #4:

(Cool because real world data-set)

Try to find a technical issue that correlates with the lifespan of a filter in a dialysis unit. Data set is smaller than normal (About 350 entries) but we can do a large amount of statistical analysis on this dataset to narrow down conclusions. Using Data gathered from an ongoing study in the nephrology unit at Cincinnati Children's Hospital
