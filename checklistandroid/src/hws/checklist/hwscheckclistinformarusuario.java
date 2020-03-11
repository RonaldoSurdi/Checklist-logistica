package hws.checklist;

import com.embarcadero.javaandroid.DBXException;
import com.embarcadero.javaandroid.TDBXReader;
import com.embarcadero.javaandroid.TJSONArray;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.DatabaseUtils.InsertHelper;
import android.os.Bundle;
import android.os.Handler;
import android.telephony.TelephonyManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;


public class hwscheckclistinformarusuario extends Activity {
	private Hwsbanco hwsbanco;
	private hwsconexaoweb hwsexisteconexaoweb = new hwsconexaoweb();
	private HwsConectaRest hwsRestConnection = new HwsConectaRest();
	private String hwscodcliente;
	private ProgressDialog hwsdialogusuario;
	private Handler hwshandleusuario = new Handler();
	@Override
    public void onCreate(Bundle savedInstanceState) 
	{
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activityinformarusuario);
        
        hwsbanco = new Hwsbanco(this);
                
        if (! hwsbanco.hwsexisteusuarios())
		{	
			if (hwsexisteconexaoweb.hwsverificaconexao(hwscheckclistinformarusuario.this))
			{
				hwsatualizalistadeusuarios();
			}
			else
			{
				AlertDialog AlertDialogBuilder = new AlertDialog.Builder(hwscheckclistinformarusuario.this).create(); 
				AlertDialogBuilder.setMessage("Não há conexão com a Internet para fazer a primeira atualização do cadastro de usuários.");
				AlertDialogBuilder.setCancelable(true);
				AlertDialogBuilder.setButton("OK", new DialogInterface.OnClickListener() 
				{			
					public void onClick(DialogInterface dialog, int which) 
					{
						hwscheckclistinformarusuario.this.finish();
					}
				});
				AlertDialogBuilder.show();
			}
		}
        else
        {
        	if (hwsexisteconexaoweb.hwsverificaconexao(hwscheckclistinformarusuario.this))
			{
				hwsatualizalistadeusuarios();
			}
        }
        
        Button hwsbtnok = (Button) findViewById(R.id.hwsbtnOK);
        Button hwsbtnsair = (Button) findViewById(R.id.hwsbtnSair);
        
        final EditText hwsedtusuario = (EditText) findViewById(R.id.hwsedtusuario);
        final EditText hwsedtsenha   = (EditText) findViewById(R.id.hwsedtsenha);
        
                
        hwsbtnsair.setOnClickListener(new Button.OnClickListener() {
			
			//@Override
			public void onClick(View v) {
				hwscheckclistinformarusuario.this.finish();
			}
		});
        
        hwsbtnok.setOnClickListener(new Button.OnClickListener() {
			
			//@Override
			public void onClick(View v) 
			{
		        final String hwsusuarioinformado = hwsedtusuario.getText().toString();
		        final String hwssenhainformada	 = hwsedtsenha.getText().toString();

				if (hwsbanco.hwsusuarioesenhacorreta(hwsusuarioinformado, hwssenhainformada))
				{
					String hwscodusuariologado = hwsbanco.hwsretornacodigodousuario(hwsusuarioinformado);					
					Intent IntentActivityInformarPlaca = new Intent(hwscheckclistinformarusuario.this, hwschecklistinformarplaca.class);
					IntentActivityInformarPlaca.putExtra("hwscodusuariologado", hwscodusuariologado);
					startActivity(IntentActivityInformarPlaca);
				}
				else
				{
					final AlertDialog AlertDialogBuilder = new AlertDialog.Builder(hwscheckclistinformarusuario.this).create(); 
					AlertDialogBuilder.setMessage("Usuário ou Senha incorretos.");
					AlertDialogBuilder.setCancelable(true);
					AlertDialogBuilder.setButton("OK", new DialogInterface.OnClickListener() 
					{			
						public void onClick(DialogInterface dialog, int which) 
						{
							AlertDialogBuilder.cancel();
						}
					});
					AlertDialogBuilder.show();					
				}
			}
		});
                
        
	}
	
    public void hwsatualizalistadeusuarios() 
    {
    	
    	hwsdialogusuario = ProgressDialog.show(hwscheckclistinformarusuario.this, "Aguarde...", "Sincronizando dados do servidor com o dispositivo móvel...",false,true);
    	hwsdialogusuario.setCancelable(false);
    	hwsdialogusuario.setCanceledOnTouchOutside(false);
    	new Thread()
    	{
    		@Override
    		public void run()
    		{
    	    	try 
    	    	{
	    			//Pegando o numero do chip do aparelho
    	      		
	        	    TelephonyManager mTelephonyMgr;
	        	    mTelephonyMgr = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);      
	        	    String Hws_Chip = mTelephonyMgr.getDeviceId();
        	        
	        	    // Verifica o status do chip
	        		TJSONArray Hws_Status_Chip = new TJSONArray();
	        		Hws_Status_Chip = hwsRestConnection.HwsPegarServerMetodos().F_HWS_RetornaStatusChip(Hws_Chip);
	        		// Verificando se o celular pertence ao cliente correto
	        	 	//Cliente Coopercarga
	        		if (Hws_Status_Chip.getString(1).equals(new String("1")) == false)
	        		{
	        			hwsfinalizadialogo(true, "Dispositivo móvel não habilitado. Entre em contato com o Administrador do Sistema.");	
	        		}
	        		String Hws_Status_Chip_OK = new String("S");
	        		// Se o primeiro elemento do vetor for S entao o Chip esta OK
	        		if (Hws_Status_Chip.getString(0).equals(Hws_Status_Chip_OK))
	        		{	
	        			hwscodcliente = Hws_Status_Chip.getString(1);
		    	    	TDBXReader hwsreaderusuarios = hwsRestConnection.HwsPegarServerMetodos().F_HWS_RetornaUsuarioDoMobile(hwscodcliente);
		    	    	if (hwsreaderusuarios.getColumns().size() == 0)
    	    			{
    	    				// Se nao retornou nada nao existe nenhum usuario no servidor
    	    				hwsfinalizadialogo(true, "Não há nenhum usuário liberado para este dispositivo.");
    	    			}
    	    			else
    	    			{
    	    				// Apaga todos os registros atuais
    	    				hwsbanco.deleteallusuarios();
    	    				InsertHelper hwsinserthelper = new InsertHelper(hwsbanco.db, "usuarios");
	    	    			
		    	    		int hwscoluna_HI_CODIGO = hwsinserthelper.getColumnIndex("HI_CODIGO");
		    	    		int hwscoluna_HI_NOME   = hwsinserthelper.getColumnIndex("HI_NOME");
		    	    		int hwscoluna_HI_EMAIL  = hwsinserthelper.getColumnIndex("HI_EMAIL");
		    	    		int hwscoluna_HI_USER   = hwsinserthelper.getColumnIndex("HI_USER");
		    	    		int hwscoluna_HI_SENHA  = hwsinserthelper.getColumnIndex("HI_SENHA");
		    	    		int hwscoluna_HI_RESENHA= hwsinserthelper.getColumnIndex("HI_RESENHA");
		    	    		try 
		    	    		{
			    	    		try
			    	    		{
			    	    				
			    	    			while (hwsreaderusuarios.next())
			    	    			{
			    	    				hwsinserthelper.prepareForInsert();
			    	    				
			    	    				hwsinserthelper.bind(hwscoluna_HI_CODIGO, hwsreaderusuarios.getValue("HI_CODIGO").GetAsString());
			    	    				hwsinserthelper.bind(hwscoluna_HI_NOME, hwsreaderusuarios.getValue("HI_NOME").GetAsString());
			    	    				hwsinserthelper.bind(hwscoluna_HI_EMAIL, hwsreaderusuarios.getValue("HI_EMAIL").GetAsString());
			    	    				hwsinserthelper.bind(hwscoluna_HI_USER, hwsreaderusuarios.getValue("HI_USER").GetAsString());
			    	    				hwsinserthelper.bind(hwscoluna_HI_SENHA, hwsreaderusuarios.getValue("HI_SENHA").GetAsString());
			    	    				hwsinserthelper.bind(hwscoluna_HI_RESENHA, hwsreaderusuarios.getValue("HI_RESENHA").GetAsString());
			    	    				
			    	    				hwsinserthelper.execute();
			    	    					
			    	    			}
			    	    		}
			    	    		finally
			    	    		{
			    	    			hwsinserthelper.close();
			    	    		}	
			    	    		hwsfinalizadialogo(false, "");
							} catch (Exception e) 
							{
								hwsfinalizadialogo(true, e.toString());
							}
    	    			}
		    	    }        			
	        		else
	        		{
	        			hwsfinalizadialogo(true, Hws_Status_Chip.getString(1));
	    			}
    			} 
    	    	catch (Exception e) 
    			{
    				hwsfinalizadialogo(true, e.toString());
    			}
    		}
    	}.start();
    }
    
    public void hwsfinalizadialogo(final Boolean hwstemerro, final String hwsmensagem)
    {
    	hwshandleusuario.post(new Runnable() {
			
			//@Override
			public void run() {
				if (hwstemerro)
				{
					Toast.makeText(hwscheckclistinformarusuario.this, hwsmensagem, Toast.LENGTH_LONG).show();
					hwscheckclistinformarusuario.this.finish();
				}				
				hwsdialogusuario.dismiss();			
			}
		});    	    	   
    }

}
