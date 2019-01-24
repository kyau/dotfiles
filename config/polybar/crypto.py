#!/usr/bin/env python3

import configparser
import os
import sys
import requests
from decimal import Decimal

config = configparser.ConfigParser()

# File must be opened with utf-8 explicitly
with open('/home/kyau/.config/polybar/crypto-config', 'r', encoding='utf-8') as f:
	config.read_file(f)

# Everything except the general section
currencies = [x for x in config.sections() if x != 'general']
base_currency = config['general']['base_currency']
params = {'convert': base_currency}

for currency in currencies:
	icon = config[currency]['icon']
	if currency == "bitcoin":
		json = requests.get(f'https://api.coinbase.com/v2/prices/BTC-USD/spot').json()['data']
		datafile = '/home/kyau/.config/polybar/.btcusd'
	elif currency == "ethereum":
		json = requests.get(f'https://api.coinbase.com/v2/prices/ETH-USD/spot').json()['data']
		datafile = '/home/kyau/.config/polybar/.ethusd'
	#json = requests.get(f'https://api.coinmarketcap.com/v1/ticker/{currency}',
	#					params=params).json()[0]
	if os.path.exists(datafile):
		text_file = open(datafile, "r")
	else:
		text_file = open(datafile, "w+")
	prev_price = text_file.read()
	if prev_price.strip() == '':
		prev_price = '1.000'
	text_file.close()
	text_file = open(datafile, "w+")
	text_file.seek(0)
	text_file.truncate()
	local_price = round(Decimal(json[f'amount']), 3)
	text_file.write(f'{local_price}')
	text_file.close()

	#change_24 = float(json['percent_change_24h'])
	change_24 = round(Decimal((local_price - Decimal(prev_price)) / Decimal(prev_price)) * 100, 3)

	display_opt = config['general']['display']
	if display_opt == 'both' or display_opt == None:
		if change_24 > 0:
			color = "F#00aa00"
			sys.stdout.write(f'{icon} %{{{color}}}${local_price}%{{F-}} {change_24}%  ')
		else:
			color = "F#aa0000"
			sys.stdout.write(f'{icon} %{{{color}}}(${local_price})%{{F-}} {change_24}%  ')

	elif display_opt == 'percentage':
		sys.stdout.write(f'{icon} {change_24:+}%  ')
	elif display_opt == 'price':
		sys.stdout.write(f'{icon} ${local_price}  ')

# vim: ft=python ts=4 sw=4 noet:
