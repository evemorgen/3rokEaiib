hash_algorithms = {
    '1': 'md5',
    '2': 'Blowfish',
    '3': 'eksblowfish',
    '5': 'sha256',
    '6': 'sha512'
}

shadow = """
root:$1$TDQFedzX$.kv51AjM.FInu0lrH1dY30:15045:0:99999:7:::
t:$1$TDQFedzX$.kv51AjM.FInu0lrH1dY30:15045:0:99999:7:::
bin:*:14195:0:99999:7:::
daemon:*:14195:0:99999:7:::
adm:*:14195:0:99999:7:::
lp:*:14195:0:99999:7:::
sync:*:14195:0:99999:7:::
shutdown:*:14195:0:99999:7:::
halt:*:14195:0:99999:7:::
mail:*:14195:0:99999:7:::
news:*:14195:0:99999:7:::
uucp:*:14195:0:99999:7:::
operator:*:14195:0:99999:7:::
games:*:14195:0:99999:7:::
gopher:*:14195:0:99999:7:::
ftp:*:14195:0:99999:7:::
nobody:*:14195:0:99999:7:::
rpm:!!:14195:0:99999:7:::
dbus:!!:14195:0:99999:7:::
avahi:!!:14195:0:99999:7:::
mailnull:!!:14195:0:99999:7:::
smmsp:!!:14195:0:99999:7:::
nscd:!!:14195:0:99999:7:::
vcsa:!!:14195:0:99999:7:::
rpc:!!:14195:0:99999:7:::
rpcuser:!!:14195:0:99999:7:::
nfsnobody:!!:14195:0:99999:7:::
sshd:!!:14195:0:99999:7:::
pcap:!!:14195:0:99999:7:::
ntp:!!:14195:0:99999:7:::
haldaemon:!!:14195:0:99999:7:::
xfs:!!:14195:0:99999:7:::
gdm:!!:14195:0:99999:7:::
sabayon:!!:14195:0:99999:7:::
netneng:$1$khkWa1Nz$vcfIQnl.MEGEqD2GMKCB81:14196:0:99999:7:::
avahi-autoipd:!!:14964::::::
oprofile:!!:15033::::::
guest:!!:15045:0:99999:7:::
root:$6$W.EOKZfu$OcEiZxDxVI6bgE.vTVhHXHMZTB4sUfaZt/1.89SG4S8AGB1zg7xa8rs8iRThX3pzpk8zsi0bCKF4kiSroMtx90:15974:0:99999:7:::
massregi:$6$t8fYiY2SSmcgeg3b$XhecLno6nw39Ml9JceNWi2PNVKextmB4mxKBO3KwmvqUXmcc7AaP37k1TWjU3l7IXM8/koBLxmHjD6B7GWhVg/:15636:0:99999:7:::
tardis:$6$pGqbclNG$NUbrsZVH7s8ytDW9sM6JX6QC98rwMpZQKS4rH9L8wqIO9ckhtBalaft/5BQtxsHBbKEP62K4FQadC3PecuQBZ.:15635:0:99999:7:::
nagios:$6$cMYRO8Pz$PCb3tA6Gm9LXdZgcXGWvcm2DStYU539INYDJwdRH8M8WK/Nud0HPBHg7iqU7kn3g91jUfNOjqxIAoSKwaCBJx/:15684:0:99999:7:::
mageshm:$6$sTgBhfj0$pkzz/JpVTl8ZAmk./d4SDarRyWsGSZHguljywUHQMP4DWo8/TgNzL5rMpejqNWuyxtFlISxdyIqPmpsIsyi.i1:16088:0:99999:7:::
2daygeek:$6$iQYB/owpGrAmMbno$GqB3KPeY3XQHir5S5OFCZO0J2Kr20PyuPKWE3ESxysmbD67xDUhEyssIZ52pIkuFfRYNEfoahHExGQZZKspC2/:16055:0:99999:7:::
2gadmin:$6$RDE/drV2R$qa9YNqAE8BF/JWhfUFEGlgQIiG1Sv1YM1ODKo3q5fOnXjoF7sVeGSw6zUztL1eZY6kh3LZ/isfz2NRzObryR3/:16091:0:99999:7:::
testuser:$6$TwPBN/o.fb$TgJNlRiIGgmhogdnM.m4Hu27XhGbSEIkDIAmbwNas7xO1Dxam5iArnXiRm.mu3LBhrfTeMDCuPxkioh7Yy/jl1:16091:0:99999:7:::
demouser:$6$kNDWc7Nk$RszhplZlNWC18Hs5OsYXhV.cw9iwMSBb2lGWOBrjOe9jxPXdtBtebOZowIoaTmj9nrd0JBCsTPvVCRnRjTmvW1:16091:0:99999:7:::
ramesh:$6$vFMBf/mm.Oq5E$l7DvxkwMNOdcWNvGUUkW7STIl/nVK6v1s4AUY2fgCfwF1FusJvEUyjsj5Bbz4TFyLhRi.sQUTXR6unxc4LxK7.:16091:0:99999:7:::
suresh:$6$MwkbFnqNh$hHqGr83EuL90AMPMHrtRxr3hgyXK1N8hYd91ZTxaEmpauy9Fii2qyWlRfpFD9Yn7XazCDxpZ7ccX1RX2/OFtN0:16091:0:99999:7:::
"""

lines = shadow.splitlines()
for line in lines:
    if line != '':
        splitted = line.split(':')
        user = splitted[0]
        password = splitted[1]
        if password != '!!' and password != '*':
            _, algo, salt, passwd = password.split('$')
            print('found real-user: %s - algorithm:  %s, salt: %s, passwd: %s' % (user, hash_algorithms[algo], salt, passwd))
