
import os
from dotenv import load_dotenv
from supabase import create_client, Client

load_dotenv()

url = os.getenv("SUPABASE_URL")
key = os.getenv("SUPABASE_KEY")

if not url or not key:
    raise RuntimeError(
        "SUPABASE_URL ou SUPABASE_KEY não foram definidas no .env"
    )

supabase: Client = create_client(url, key)

