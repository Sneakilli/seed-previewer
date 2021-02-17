import tweepyauth
import tweepy
import os
from datetime import datetime
import time

api = tweepyauth.auto_authenticate()

basepath = "G:/MultiMC/instances/1.16.5/.minecraft/screenshots/"
TimeFile = "LastTweetTime.txt"
PostingHour = 17

ShouldTweet = False

def DoTweet():
    AllSeeds = os.listdir(basepath)
    Seed = AllSeeds[0]
    TodaySeed = basepath + Seed
    ImageIDList = []
    if (ShouldTweet):
        for x in os.listdir(TodaySeed):
            ImageIDList.append(api.media_upload(TodaySeed + "/" + x).media_id)

        TextForTweet = "Seed:" + Seed + "\nVersion: 1.16.5" #Space is put into directory by AHK
        tweet = api.update_status(status=TextForTweet,media_ids=ImageIDList)
        DeleteDirectory(TodaySeed)
    print ("tweeted seed" + Seed)
    
    
    
    return datetime.now().day

def DeleteDirectory(dirtodelete):
    for x in os.listdir(dirtodelete):
        os.remove(dirtodelete + "/" + x)
    os.rmdir(dirtodelete)

def DoChecks(lasttweet):
    if (str(datetime.now().day) != str(lasttweet)) and (datetime.now().hour >= PostingHour):
        return str(DoTweet())

def Main():
    currentpath = os.path.dirname(os.path.realpath(__file__)) + "\\"
    if os.path.isfile(currentpath + TimeFile) == False:
        f = open(currentpath + TimeFile, "x")
        f.close()
        
    with open(currentpath + TimeFile, "r") as f:
        tweetday = DoChecks(f.read())
        
    with open(currentpath + TimeFile, "w") as f:
        if (tweetday != None):
            f.write(tweetday)
            print (tweetday)


    
if __name__ == '__main__':
    while True:
        Main()
        print ("waiting...")
        time.sleep(1800)