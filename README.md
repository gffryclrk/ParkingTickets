## Toronto Public Data
### Parking Ticket Sideproject

### Overview
This is an exploratory data project. My goal is to practice some data science & big data tools while working on a moderately sized data set (approximatley 24 million observations). The [dataset](https://www.toronto.ca/city-government/data-research-maps/open-data/open-data-catalogue/#75d14c24-3b7e-f344-4412-d8fd41f89455) is from Toronto's Open Data Catalog.

### Preparation
The first thing I did, after downloading and extracting all the CSVs, was to load them into Hadoop. I would eventually like to Geocode the street addresses to longitute & latitude values but first needed to know the scope of such an operation so I used Pig to create a file containing the distinct street addresses in the dataset (CreateDistinct.pig). This reduced the number of Geocodes from 24 million to some 875,000 (approx). A quick eyeball test showed that many of the street addresses contained were still nonsense: single letter, 'A', single number, '11', or some punctuation '"'. There were also quite a few street names without an address (such as Yonge St) which I didn't think would be very useful for geocoding so I created a new file, clean_distinct, using egrep:

```sh
egrep -a '\d+\s?[A-Za-z]+' part-v001-o000-r-00000 >> clean_distinct
```

That reduced the 875,000 to around 440,000. There are still some unusable addresses in there but we're off to a pretty good start. My eventual gameplan is to Geocode these street addresses and then join them back into the original dataset. Observations without matching lat & long coordinates will most likely be removed. 
  
