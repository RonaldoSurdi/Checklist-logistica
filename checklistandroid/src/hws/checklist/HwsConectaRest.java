package hws.checklist;

import android.util.Log;

import com.embarcadero.javaandroid.DSProxy.THWS_ServerMethods;
import com.embarcadero.javaandroid.DSRESTConnection;

public class HwsConectaRest extends DSRESTConnection 
{
	private DSRESTConnection restconn;
	//private THWSServerMethods restmetodos; 
	
	public HwsConectaRest()		
	{		
		try 
		{
			this.setHost("app000001.hwsmobile.com.br");
			this.setPort(8080);	
			this.setUserName("hwsadminmobile");
			this.setPassword("Yd459*jhdD82Klaw82HHww1oPqjd");
		} catch (Exception e) 
		{
			Log.d("hwsabrirconexao", e.toString());			
		}
		 		
	}
	
	public THWS_ServerMethods HwsPegarServerMetodos() 
	{
		THWS_ServerMethods restmetodos = new THWS_ServerMethods(this);
		return restmetodos;

	}

}

