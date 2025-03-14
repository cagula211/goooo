import requests
import time

# Configurare
api_url = "https://graph.facebook.com/v17.0/9412564635476939/messages"
access_token = "EACFwrXuF48sBO45rMiFL2yR6KDJJWL3aUMZApWr6OAEtxoXchSEKb2N4SbSXfKIOuSKAzM4SkJKMZBgHZCZCe5mUQtJ1PiUFdUbpFOKHqNNRJxqdHXo27jnDQsIXnMuaLrbH0uRXU58M1ZCZBZC37I7dBZCRcBPFJrstudXz7rOhZB3GFRwBaAZBfXSUGTYiqF6uiJaYy1d6Y1okO7iq4xAZAnverkoy3MurU6F2FFW9Q4ZD"
phone_number = "+393533870586"  # Numărul de telefon destinatar
message = "Acesta este un mesaj automat!"

# Funcție pentru trimiterea mesajului
def send_whatsapp_message():
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Content-Type": "application/json"
    }
    payload = {
        "messaging_product": "whatsapp",
        "to": phone_number,
        "type": "text",
        "text": {
            "body": message
        }
    }
    response = requests.post(api_url, headers=headers, json=payload)
    if response.status_code == 200:
        print("Mesaj trimis cu succes!")
    else:
        print(f"Eroare: {response.status_code}, {response.text}")

# Trimite mesaje nonstop (cu o pauză între ele)
while True:
    send_whatsapp_message()
    time.sleep(10)  # Așteaptă 10 secunde între mesaje
