<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->
<ncl id="Clima" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>

		<regionBase>
			<region id="rgTV">
				<region id="rgVideo" left="5%" right="5%" top="10%" width="720" height="480" zIndex="0" />
				<region id="rgBotao" right="5%" top="5%" width="135" height="154" zIndex="1"/>
				<region id="rgTemperatura" right="1%" top="10%" width="300" height="70" zIndex="1"/>
				<region id="rgMenu" right="5%" top="5%" width="330" height="255" zIndex="1"/>
			</region>
		</regionBase>	
		
		<descriptorBase>
			<descriptor id="descVideo" region="rgVideo"/>
			<descriptor id="descBotao" region="rgBotao">
				<descriptorParam name="transparency" value="30%"/>
			</descriptor>
			<descriptor id="descTemperatura" region="rgTemperatura">
				<descriptorParam name="fontColor" value="lime"/>
				<descriptorParam name="fontSize" value="20"/>
			</descriptor>
			<descriptor id="descMenu" region="rgMenu"/>
		</descriptorBase>
		
		<connectorBase>
			<causalConnector id="onBeginStart">
				<simpleCondition role="onBegin" />
				<simpleAction role="start" />
			</causalConnector>
			<causalConnector id="onBeginStop">
				<simpleCondition role="onBegin" />
				<simpleAction role="stop" />
			</causalConnector>
			<causalConnector id="onEndStop">
				<simpleCondition role="onEnd" />
				<simpleAction role="stop" max="unbounded" />
			</causalConnector>
			<causalConnector id="onKeySelectionStart">
				<connectorParam name="key"/>
				<simpleCondition role="onSelection" key="$key" />
				<simpleAction role="start" max="unbounded" qualifier="par" />
			</causalConnector>
		</connectorBase>   
		    
	</head>

	<body>
		<port id="portaPrincipal" component="vidCnn"/>
		
		<media id="vidCnn" src="media/cnn.mp4" descriptor="descVideo"/>
		<media id="botaoInt" src="media/interactive.png" descriptor="descBotao"/>
		<media id="menu" src="media/menu.png" descriptor="descMenu"/>
		<media id="tJPA" src="media/jpa.txt" descriptor="descTemperatura"/>
		<media id="tPOA" src="media/poa.txt" descriptor="descTemperatura"/>
		<media id="tGRU" src="media/gru.txt" descriptor="descTemperatura"/>
		
		<link xconnector="onBeginStart">
			<bind role="onBegin" component="vidCnn"/>
			<bind role="start" component="botaoInt" />
		</link>
		
		<!-- LOOP MENU E BOTAOi -->
		<link xconnector="onKeySelectionStart">
			<bind role="onSelection" component="botaoInt">
				<bindParam name="key" value="BLUE"/>
			</bind>
			<bind role="start" component="menu"/>
		</link>
		

		<link xconnector="onKeySelectionStart">
			<bind role="onSelection" component="menu">
				<bindParam name="key" value="RED"/>
			</bind>
			<bind role="start" component="botaoInt" />
		</link>
		
		<link xconnector="onBeginStop">
			<bind role="onBegin" component="botaoInt" />
			<bind role="stop" component="menu" />			
		</link>

		<link xconnector="onBeginStop">
			<bind role="onBegin" component="menu" />
			<bind role="stop" component="botaoInt"/>			
		</link>
	
		<!--LOOP (MENU E TEMP1-GRU) && (TEMP1-GRU E BOTAOi) -->
		<link xconnector="onKeySelectionStart">
			<bind role="onSelection" component="menu">
				<bindParam name="key" value="1"/>
			</bind>
			<bind role="start" component="tGRU"/>
		</link>
		

		<link xconnector="onKeySelectionStart">
			<bind role="onSelection" component="tGRU">
				<bindParam name="key" value="GREEN"/>
			</bind>
			<bind role="start" component="menu" />
		</link>
		
		<link xconnector="onKeySelectionStart">
			<bind role="onSelection" component="tGRU">
				<bindParam name="key" value="RED"/>
			</bind>
			<bind role="start" component="botaoInt"/>
		</link>
		
		<link xconnector="onBeginStop">
			<bind role="onBegin" component="tGRU" />
			<bind role="stop" component="menu" />			
		</link>

		<link xconnector="onBeginStop">
			<bind role="onBegin" component="menu" />
			<bind role="stop" component="tGRU"/>			
		</link>
		
		<link xconnector="onBeginStop">
			<bind role="onBegin" component="botaoInt"/>
			<bind role="stop" component="tGRU"/>
		</link>
		
		<link xconnector="onBeginStop">
			<bind role="onBegin" component="tGRU"/>
			<bind role="stop" component="botaoInt"/>
		</link>
		
		
		<!--LOOP (MENU E TEMP2-POA) && (TEMP2-POA E BOTAOi) -->
		<link xconnector="onKeySelectionStart">
			<bind role="onSelection" component="menu">
				<bindParam name="key" value="2"/>
			</bind>
			<bind role="start" component="tPOA"/>
		</link>
		

		<link xconnector="onKeySelectionStart">
			<bind role="onSelection" component="tPOA">
				<bindParam name="key" value="GREEN"/>
			</bind>
			<bind role="start" component="menu" />
		</link>
		
		<link xconnector="onKeySelectionStart">
			<bind role="onSelection" component="tPOA">
				<bindParam name="key" value="RED"/>
			</bind>
			<bind role="start" component="botaoInt"/>
		</link>
		
		<link xconnector="onBeginStop">
			<bind role="onBegin" component="tPOA" />
			<bind role="stop" component="menu" />			
		</link>

		<link xconnector="onBeginStop">
			<bind role="onBegin" component="menu" />
			<bind role="stop" component="tPOA"/>			
		</link>
		
		<link xconnector="onBeginStop">
			<bind role="onBegin" component="botaoInt"/>
			<bind role="stop" component="tPOA"/>
		</link>
		
		<link xconnector="onBeginStop">
			<bind role="onBegin" component="tPOA"/>
			<bind role="stop" component="botaoInt"/>
		</link>
		
		
		<!--LOOP (MENU E TEMP3-JPA) && (TEMP3-JPA E BOTAOi) -->
		<link xconnector="onKeySelectionStart">
			<bind role="onSelection" component="menu">
				<bindParam name="key" value="3"/>
			</bind>
			<bind role="start" component="tJPA"/>
		</link>
		

		<link xconnector="onKeySelectionStart">
			<bind role="onSelection" component="tJPA">
				<bindParam name="key" value="GREEN"/>
			</bind>
			<bind role="start" component="menu" />
		</link>
		
		<link xconnector="onKeySelectionStart">
			<bind role="onSelection" component="tJPA">
				<bindParam name="key" value="RED"/>
			</bind>
			<bind role="start" component="botaoInt"/>
		</link>
		
		<link xconnector="onBeginStop">
			<bind role="onBegin" component="tJPA" />
			<bind role="stop" component="menu" />			
		</link>

		<link xconnector="onBeginStop">
			<bind role="onBegin" component="menu" />
			<bind role="stop" component="tJPA"/>			
		</link>
		
		<link xconnector="onBeginStop">
			<bind role="onBegin" component="botaoInt"/>
			<bind role="stop" component="tJPA"/>
		</link>
		
		<link xconnector="onBeginStop">
			<bind role="onBegin" component="tJPA"/>
			<bind role="stop" component="botaoInt"/>
		</link>
		
		
		<!--PARAR LOOP QUANDO O VIDEO TERMINAR-->
		<link xconnector="onEndStop">
			<bind role="onEnd" component="vidCnn"/>
			<bind role="stop" component="menu"/>
			<bind role="stop" component="botaoInt"/>
			<bind role="stop" component="tJPA"/>
			<bind role="stop" component="tPOA"/>
			<bind role="stop" component="tGRU"/>
		</link>
		
	</body>	
</ncl>