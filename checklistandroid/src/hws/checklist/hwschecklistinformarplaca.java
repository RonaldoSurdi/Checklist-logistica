package hws.checklist;



import java.sql.Time;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.TimeZone;

import com.embarcadero.javaandroid.TDBXReader;
import com.embarcadero.javaandroid.TJSONArray;
import com.embarcadero.javaandroid.TJSONObject;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.DialogInterface.OnClickListener;
import android.database.DatabaseUtils.InsertHelper;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.sax.Element;
import android.telephony.TelephonyManager;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.LayoutInflater;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.AdapterView;
import android.widget.AdapterView.AdapterContextMenuInfo;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

public class hwschecklistinformarplaca extends Activity {

	/** Called when the activity is first created. */
	private Hwsbanco hwsbanco;
	private HwsConectaRest hwsRestConnection = new HwsConectaRest();
	private ProgressDialog hwsdialog;
	private String hwscodcliente;
	private Handler hwshandle = new Handler();
	private hwsconexaoweb hwsexisteconexaoweb = new hwsconexaoweb();
	private ListView hwslistcheclistspendentes;
	private ArrayList<HashMap<String, String>> hwslistadechecklistsnaosincronizados = new ArrayList<HashMap<String, String>>();
	private String hwscodusuariologado;	
	
		
	@Override
    protected void onDestroy() {
    	super.onDestroy();
    	hwsbanco.close();	
    }
	
	@Override
    public void onRestart() 
	{
		super.onRestart();
		hwsmontalistadoschecklistssemsincronizacao();
	}

	
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activityinformarplaca);

        Intent hwsIntentpLaca = getIntent();
        hwscodusuariologado = hwsIntentpLaca.getStringExtra("hwscodusuariologado");
                
    	Button hwsbtnnovo = (Button) findViewById(R.id.btnnovo);
    	hwslistcheclistspendentes = (ListView) findViewById(R.id.hwschecklistsnaosincronizados);
        
    	hwsbanco = new Hwsbanco(this);
    	
    	// Ao acessar o sistema verifica se nao existe nenhum checklist pendente
    	// Se nao existir então atualiza a lista de perguntas
    	// hwsbanco.deleteallchecklistsrealizados();
    	if (hwsbanco.existechecklistsemsincronizacao())
    	{
    		hwsmontalistadoschecklistssemsincronizacao();    		
    	}
    	else
    	{
    		try 
    		{
        		hwsatualizaperguntasdochecklist();
			} catch (Exception e) 
			{
				AlertDialog AlertDialogBuilder = new AlertDialog.Builder(this).create(); 
				AlertDialogBuilder.setMessage(e.toString()); 
				AlertDialogBuilder.setButton("OK", new DialogInterface.OnClickListener() 
				{			
					public void onClick(DialogInterface dialog, int which) 
					{
						hwschecklistinformarplaca.this.finish();
					}
				});
				AlertDialogBuilder.show();
			}	
        	
    		
    	}              	        
    
	    hwsbtnnovo.setOnClickListener(new Button.OnClickListener()
	    {
			public void onClick(View arg0) 
	        {
				final EditText hwsedtplaca = (EditText) findViewById(R.id.edtplaca);
				hwsedtplaca.setText(hwsedtplaca.getText().toString().toUpperCase());
		    	//Verifica se a placa existe no cadastro de veiculos do dispositivo movel
				if (hwsbanco.existeplaca(hwsedtplaca.getText().toString()))
				{
		            Intent IntentActivityFormularioCheckList = new Intent(hwschecklistinformarplaca.this, hwschecklistformulariochecklist.class);
		            IntentActivityFormularioCheckList.putExtra("hwsveiculo", hwsedtplaca.getText().toString() );
		            IntentActivityFormularioCheckList.putExtra("hwscodusuariologado", hwscodusuariologado);
		            startActivity(IntentActivityFormularioCheckList);
				}
				else
				{
					AlertDialog AlertDialogBuilder = new AlertDialog.Builder(hwschecklistinformarplaca.this).create(); 
					AlertDialogBuilder.setMessage("A placa digitada não foi localizada no cadastro de veículos."); 
					AlertDialogBuilder.setButton("OK", new DialogInterface.OnClickListener() 
					{			
						public void onClick(DialogInterface dialog, int which) 
						{
							hwsedtplaca.setFocusable(true);
						}
					});
					AlertDialogBuilder.show();					
				}
			}
	    });
		    
	}
	
	public void hwsatualizaperguntasdochecklist() 
    {
    	
    	hwsdialog = ProgressDialog.show(hwschecklistinformarplaca.this, "Aguarde...", "Sincronizando dados do servidor com o dispositivo móvel...",false,true);
    	hwsdialog.setCancelable(false);
    	hwsdialog.setCanceledOnTouchOutside(false);
    	hwsdialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
    	new Thread()
    	{
    		@Override
    		public void run()
    		{
    	    	// Trazendo as perguntas do servidor    			
    	    	TDBXReader hwsreaderperguntaschecklist;
    	    	TDBXReader hwsreaderveiculos;
    	    	try 
    	    	{
    	    		// Veri
	    			// Verifica se existe conexao com a Web
	    			if (hwsexisteconexaoweb.hwsverificaconexao(hwschecklistinformarplaca.this))
	    			{
	    				//Pegando o numero do chip do aparelho
    	      		
	        	        TelephonyManager mTelephonyMgr;
	        	        mTelephonyMgr = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);      
	        	        String Hws_Chip = mTelephonyMgr.getDeviceId();
        	        
	        	        // Verifica o status do chip
	        			TJSONArray Hws_Status_Chip = new TJSONArray();
	        			Hws_Status_Chip = hwsRestConnection.HwsPegarServerMetodos().F_HWS_RetornaStatusChip(Hws_Chip);    		 
	        			String Hws_Status_Chip_OK = new String("S");
	        			// Se o primeiro elemento do vetor for S entao o Chip esta OK
	        			if (Hws_Status_Chip.getString(0).equals(Hws_Status_Chip_OK))
	        			{	
		    	    		
		    	    		String hwschecklistatualdomovel = hwsbanco.hwsretornachecklistatual();
		    	    		
		    	    		TJSONArray hwsexistenovochecklistnoservidor = hwsRestConnection.HwsPegarServerMetodos().F_HWS_ExisteNovoCheckList("1", hwschecklistatualdomovel);
		    	    		
		    	    		// Se existir um novo checklist no servidor entao atualiza as perguntas do dispositivo movel
		    	    		if (hwsexistenovochecklistnoservidor.getString(0).equals(new String("S")))
		    	    		{
		    	    		
		    	    			hwsreaderperguntaschecklist = hwsRestConnection.HwsPegarServerMetodos().F_HWS_RetornaCheckListPerguntas("1");    	    		
		    	    			if (hwsreaderperguntaschecklist.getColumns().size() == 0)
		    	    			{
		    	    				// Se nao retornou nada nao existe nenhuma pergunta no servidor
		    	    				hwsfinalizadialogo(true, "Não há nenhum formulário de perguntas liberado para este dispositivo.");
		    	    			}
		    	    			else
		    	    			{
		    	    				// Apaga todos os registros atuais
		    	    				hwsbanco.deleteallperguntasdochecklist();
		    	    				while (hwsreaderperguntaschecklist.next())
		    	    				{
		    	    					// Gravando no banco de dados no dispositivo movel
		    	    					hwsbanco.insertperguntasdochecklist(
		    	    						hwsreaderperguntaschecklist.getValue("A9_CODIGO").GetAsString(),	
		    	    						hwsreaderperguntaschecklist.getValue("A9_DESC").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AA_CODIGO").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AA_CODERP").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AA_DESC").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AB_CODIGO").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AB_DESC").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AD_CODIGO").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AD_PERGUNTA").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AF_CODIGO").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AF_RESPOSTA").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AG_PERFILHA").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AI_CODPER").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AJ_QTDRESTR").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AH_ID").GetAsString(),
		    	    						hwsreaderperguntaschecklist.getValue("AD_TIPO").GetAsString());
		    	    				}
		    	    			}
		    	    		}

	    	    			// Verificando se existe placas nao sincronizadas. Se existir sincroniza
		    	    		

	    	    			int hwsmaxid = hwsbanco.selectmaxidveiculos();
	    	    				
			    	    	// Apos sincronizar as placas verifica se nao existe nenhuma nova placa no servidor			    	    		
		    	    		hwsreaderveiculos = hwsRestConnection.HwsPegarServerMetodos().F_HWS_RetornaVeiculos(Hws_Chip,Integer.toString(hwsmaxid));
		    	    		
		    	    		InsertHelper hwsinserthelper = new InsertHelper(hwsbanco.db, "veiculos");
		    	    			
		    	    		int hwscoluna_BA_PLACA = hwsinserthelper.getColumnIndex("BA_PLACA");
		    	    		int hwscoluna_BA_DESC  = hwsinserthelper.getColumnIndex("BA_DESC");
		    	    		int hwscoluna_BA_TIPO  = hwsinserthelper.getColumnIndex("BA_TIPO");
		    	    		int hwscoluna_BA_ID    = hwsinserthelper.getColumnIndex("BA_ID");
	    	    			String horainicial = getHoraAtual();
	    	    			String horafinal = getHoraAtual();
		    	    		try 
		    	    		{
			    	    		try
			    	    		{
			    	    				
			    	    			while (hwsreaderveiculos.next())
			    	    			{
			    	    				
			    	    				// Se a placa ja existir entao exclui a placa e cadastra-a novamente
			    	    				// Isso e para alteracoes no tipo do implemento que vem do sistema da coopercarga
			    	    				if (hwsbanco.existeplaca(hwsreaderveiculos.getValue("BA_PLACA").GetAsString()))
			    	    				{
			    	    					hwsbanco.deleteplaca(hwsreaderveiculos.getValue("BA_PLACA").GetAsString());
			    	    				}
			    	    				
			    	    				hwsinserthelper.prepareForInsert();
			    	    				
			    	    				hwsinserthelper.bind(hwscoluna_BA_PLACA, hwsreaderveiculos.getValue("BA_PLACA").GetAsString());
			    	    				hwsinserthelper.bind(hwscoluna_BA_DESC, hwsreaderveiculos.getValue("BA_DESC").GetAsString());
			    	    				hwsinserthelper.bind(hwscoluna_BA_TIPO, hwsreaderveiculos.getValue("BA_TIPO").GetAsString());
			    	    				hwsinserthelper.bind(hwscoluna_BA_ID,   hwsreaderveiculos.getValue("BA_ID").GetAsString());
			    	    				
			    	    				hwsinserthelper.execute();
			    	    				
			    	    					
			    	    			}
			    	    		}
			    	    		finally
			    	    		{
			    	    			horafinal = getHoraAtual();
			    	    			hwsinserthelper.close();
			    	    		}	
							} catch (Exception e) 
							{
									hwsfinalizadialogo(true, e.toString());
							}
		    	    		hwsfinalizadialogo(false, "Hora Inicial: " + horainicial + " - Hora Final: " + horafinal);
		    	    	}        			
	        			else
	        			{
	        				hwsfinalizadialogo(true, Hws_Status_Chip.getString(1));	
	        			}
	    			}
	    			else
	    			{
	    				// Se caso os cadastros nao possuirem dados, nao acessa o sistema sem conexao com internet
	    				if (! hwsbanco.existecadastrodeveiculos() || ! hwsbanco.existecadastrodeperguntas())
	    				{
	    					hwsfinalizadialogo(true, "Não há conexão com a Internet. Não será possível acessar o aplicativo.");
	    				}
	    				else
	    				{
	    					hwsfinalizadialogo(false, "");
	    				}
	    			}    	    		
    			} catch (Exception e) 
    			{
    				hwsfinalizadialogo(true, e.toString());
    			}
    		}
    	}.start();
    }

	public void hwsmontalistadoschecklistssemsincronizacao()
	{
		// Monta a Lista de CheckLists Pendentes ou Nao Sincronizados
		hwslistadechecklistsnaosincronizados = hwsbanco.selectchecklistspendentesounaosincronizados();
		String[] 	from = { "BB_PLACA", "BA_DESC" };
		int[] 		to = { android.R.id.text1, android.R.id.text2 };
		
		SimpleAdapter adapter = new SimpleAdapter(this, hwslistadechecklistsnaosincronizados, android.R.layout.simple_list_item_2, from, to);
		
		hwslistcheclistspendentes.setAdapter(adapter);
		
		OnItemClickListener hwslistener = new OnItemClickListener() 
		{
		      public void onItemClick(AdapterView<?> parent, View view, int position, long id) 
		      {
		    	  	Intent IntentActivityFormularioCheckList = new Intent(hwschecklistinformarplaca.this, hwschecklistformulariochecklist.class);
		  	    	IntentActivityFormularioCheckList.putExtra("hwsveiculo", hwslistadechecklistsnaosincronizados.get(position).get("BB_PLACA") );
		  	    	IntentActivityFormularioCheckList.putExtra("hwscodusuariologado", hwscodusuariologado);
		  	    	startActivity(IntentActivityFormularioCheckList);			    	  
		      }
		};
		hwslistcheclistspendentes.setOnItemClickListener(hwslistener);
	}
	
	public void hwsfinalizadialogo(final Boolean hwstemerro, final String hwsmensagem)
    {
    	hwshandle.post(new Runnable() {
			
			//@Override
			public void run() {
				if (hwstemerro)
				{
					Toast.makeText(hwschecklistinformarplaca.this, hwsmensagem, Toast.LENGTH_LONG).show();
					hwschecklistinformarplaca.this.finish();
				}
				hwsdialog.dismiss();			
			}
		});    	    	   
    }
	
	public static String getHoraAtual() {  
	    Calendar cal = Calendar.getInstance(TimeZone.getDefault());  
	  
	    int horas = cal.get(Calendar.HOUR_OF_DAY);  
	    int minutos = cal.get(Calendar.MINUTE);  
	  
	    NumberFormat nf = NumberFormat.getInstance();  
	    nf.setMinimumIntegerDigits(2);
	    String hwshoras = nf.format(horas);
	    String hwsminutos = nf.format(minutos);
	    
	    return hwshoras + ":" + hwsminutos;  
	}
}