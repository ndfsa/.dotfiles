from libqtile.command_client import CommandClient
c = CommandClient()
print(c.call("shutdown")())
