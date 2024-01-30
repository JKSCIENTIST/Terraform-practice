import boto3
import python
from botocore.vendored import requests
def lambda_handler(event, context):
    

    def currency_converter(money,val):
        inr_to_usd = 0.012
        usd_to_inr = 83.19
        if(val==0):
            money *= inr_to_usd
            print(f"USD : {money}")
        elif(val==1):
            money*=usd_to_inr
            print(f"INR : {money}")
        return "Converted Successfully!"

    money = float(input("Enter your money in hand :"))
    print("0 for inr_to_usd and 1 for usd_to_inr : ",end='')
    value = int(input())
    output = currency_converter(money,value)
    print(output)

    result = output
    return {
        'statusCode' : 200,
        'body': result
    }
