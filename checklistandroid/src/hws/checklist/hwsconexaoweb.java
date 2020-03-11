package hws.checklist;

import android.accessibilityservice.AccessibilityService;
import android.content.Context;
import android.net.ConnectivityManager;

public class hwsconexaoweb {
	
	
	public hwsconexaoweb() 
	{ 
		
    }
	
	public boolean hwsverificaconexao(Context context)
	{
		try { 			
            ConnectivityManager cm = (ConnectivityManager) context.getSystemService(AccessibilityService.CONNECTIVITY_SERVICE); 
            if (cm.getNetworkInfo(ConnectivityManager.TYPE_MOBILE).isConnected()) { 
                    return true; 
            } else if(cm.getNetworkInfo(ConnectivityManager.TYPE_WIFI).isConnected()){ 
                    return true; 
            } else { 
                    return false; 
            } 
        } catch (Exception e) { 
                return false; 
        } 	
		
	}

}
