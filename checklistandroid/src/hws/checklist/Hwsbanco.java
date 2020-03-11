package hws.checklist;

import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

import com.embarcadero.javaandroid.DBXException;
import com.embarcadero.javaandroid.TDBXReader;
import com.embarcadero.javaandroid.TJSONArray;

import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils.InsertHelper;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import android.util.Log;
import android.widget.Chronometer;

public class Hwsbanco 
{
	private static final String DATABASE_NAME = "hws.db";
	private static final int DATABASE_VERSION = 21;
	
	private Context context;
	public SQLiteDatabase db;

	private SQLiteStatement insertStmtperguntasdochecklist;
	private SQLiteStatement insertStmtveiculos;
	private static final String INSERTPERGUNTASDOCHECKLIST = "insert into perguntasdochecklist (A9_CODIGO, A9_DESC, AA_CODIGO, AA_CODERP, AA_DESC, AB_CODIGO, AB_DESC, AD_CODIGO, AD_PERGUNTA, AF_CODIGO, AF_RESPOSTA, AG_PERFILHA, AI_CODPER, AJ_QTDRESTR, AH_ID, AD_TIPO) " +
	      "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	
	private static final String INSERTVEICULOS = "insert into veiculos (BA_PLACA, BA_DESC, BA_TIPO, BA_ID) values (?,?,?,?)";
	public Hwsbanco(Context context) 
	{
		this.context = context;
		OpenHelper openHelper = new OpenHelper(this.context);
		this.db = openHelper.getWritableDatabase();
		this.insertStmtperguntasdochecklist = this.db.compileStatement(INSERTPERGUNTASDOCHECKLIST);
		this.insertStmtveiculos				= this.db.compileStatement(INSERTVEICULOS); 
	}

	public long insertperguntasdochecklist(String A9_CODIGO, String A9_DESC, String AA_CODIGO, String AA_CODERP, String AA_DESC, String AB_CODIGO, String AB_DESC, String AD_CODIGO, String AD_PERGUNTA, 
			String AF_CODIGO, String AF_RESPOSTA, String AG_PERFILHA, String AI_CODPER, String AJ_QTDRESTR, String AH_ID, String AD_TIPO)
	{
		this.insertStmtperguntasdochecklist.bindString( 1, A9_CODIGO);
		this.insertStmtperguntasdochecklist.bindString( 2, A9_DESC);
		this.insertStmtperguntasdochecklist.bindString( 3, AA_CODIGO);
		this.insertStmtperguntasdochecklist.bindString( 4, AA_CODERP);
		this.insertStmtperguntasdochecklist.bindString( 5, AA_DESC);
		this.insertStmtperguntasdochecklist.bindString( 6, AB_CODIGO);
		this.insertStmtperguntasdochecklist.bindString( 7, AB_DESC);
		this.insertStmtperguntasdochecklist.bindString( 8, AD_CODIGO);
		this.insertStmtperguntasdochecklist.bindString( 9, AD_PERGUNTA);
		this.insertStmtperguntasdochecklist.bindString(10, AF_CODIGO);
		this.insertStmtperguntasdochecklist.bindString(11, AF_RESPOSTA);
		this.insertStmtperguntasdochecklist.bindString(12, AG_PERFILHA);
		this.insertStmtperguntasdochecklist.bindString(13, AI_CODPER);
		this.insertStmtperguntasdochecklist.bindString(14, AJ_QTDRESTR);
		this.insertStmtperguntasdochecklist.bindString(15, AH_ID);
		this.insertStmtperguntasdochecklist.bindString(16, AD_TIPO);
	    return this.insertStmtperguntasdochecklist.executeInsert();
	}
	
	public long insertveiculos(String BA_PLACA, String BA_DESC, String BA_TIPO, int BA_ID)
	{
		this.insertStmtveiculos.bindString( 1, BA_PLACA);
		this.insertStmtveiculos.bindString( 2, BA_DESC);
		this.insertStmtveiculos.bindString( 3, BA_TIPO);
		this.insertStmtveiculos.bindLong(4, BA_ID);
	    return this.insertStmtveiculos.executeInsert();
	}
	
	public void deleteallperguntasdochecklist()
	{
		this.db.delete("perguntasdochecklist", null, null);
	}
	
	public void deleteallusuarios()
	{
		this.db.delete("usuarios", null, null);
	}
	
	public void deleteallchecklistsrealizados()
	{
		this.db.delete("checklistsrealizados", null, null);
	}
	
	public void deleteallveiculos()
	{
		this.db.delete("veiculos", null, null);
	}
		
	public void close() 
	{
		this.db.close();
	}
	
	public boolean existeplaca(String hwsplaca)
	{
		String[] param = {hwsplaca};
		Cursor cursor = this.db.rawQuery("select BA_PLACA from veiculos where BA_PLACA = ?", param); 
		if (cursor.getCount() > 0)   
		{
			cursor.close(); 
			return true;
		}
		else
		{
			 cursor.close();
			 return false;
		}		
	}
	
	public boolean deleteplaca(String hwsplaca)
	{
		this.db.execSQL("delete from veiculos where BA_PLACA = '" + hwsplaca + "'");
		return true;
	}		
	
	public boolean updateobservacaoestatusecoduser(String hwsplaca, String hwsobs, String hwsstatus, String hwscoduser)
	{
		hwsobs = hwsobs.replace("'", "");
		this.db.execSQL("update checklistsrealizados set BB_OBS = '"+hwsobs+"', BB_STATUS = '"+hwsstatus+"', BB_CODUSER = '"+hwscoduser+"' where BB_PLACA = '" + hwsplaca + "'");
		return true;
	}
	
	public ArrayList<HashMap<String, String>>  selectdadosdoveiculo(String hwsplaca) 
	{
		ArrayList<HashMap<String, String>> hwsdadosdoveiculo = new ArrayList<HashMap<String, String>>();
		Cursor cursor = this.db.rawQuery("select " +
										"BA_PLACA, " +
										"BA_DESC, " +
										"BA_TIPO " +
										"from " +
										"veiculos " +
										"where " +
										"BA_PLACA = '" + hwsplaca + "' ",null);
		if (cursor.moveToFirst()) 
		{
			do 
			{
				HashMap<String, String> hwsregistrodadosdoveiculos = new HashMap<String, String>();
				hwsregistrodadosdoveiculos.put("BA_PLACA", 		cursor.getString(0));
				hwsregistrodadosdoveiculos.put("BA_DESC", 		hwscapitalizar(cursor.getString(1)));
				hwsregistrodadosdoveiculos.put("BA_TIPO", 		cursor.getString(2));
				hwsdadosdoveiculo.add(hwsregistrodadosdoveiculos);
			} 
				while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwsdadosdoveiculo;			
	}
	
	public String hwsretornachecklistatual() 
	{
		Cursor cursor = this.db.rawQuery("select " +
										 "distinct " +	
										 "A9_CODIGO " +
										 "from " +
										 "perguntasdochecklist ",null);		
		String hwsresultcursor = "";
		if (cursor.moveToFirst()) 
		{
			do 
			{
				hwsresultcursor = cursor.getString(0);
			} 
				while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwsresultcursor;
	}
	
	public String hwsretornaobservacao(String hwsplaca) 
	{
		Cursor cursor = this.db.rawQuery("select " +
										 "distinct " +	
										 "BB_OBS " +
										 "from " +
										 "checklistsrealizados " +
										 "where " +
										 "BB_PLACA = '" + hwsplaca + "'",null);		
		String hwsresultcursor = "";
		if (cursor.moveToFirst()) 
		{
			do 
			{
				hwsresultcursor = cursor.getString(0);
			} 
				while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwsresultcursor;
	}
	
	public boolean existeperguntaerespostarestricao(String hwsplaca, String hwstipoimplemento) 
	{
		Cursor cursor = this.db.rawQuery("select " +
										 "AB_CODIGO, " +
										 "AJ_QTDRESTR QTDRESTRICAOPERMITIDA, " +
										 "count(AB_CODIGO) as QTDRESPONDIDAS " +
										 "from " +
										 "perguntasdochecklist " +
										 "where " +
										 "AA_CODERP = '"+hwstipoimplemento+"' and " +
										 "AJ_QTDRESTR <> '' and " +
										 "AH_ID in " +
										 "(select " +
										 "BB_ID from " +
										 "checklistsrealizados " +
										 " where " +
										 "BB_PLACA = '"+hwsplaca+"') " +
										 "group by " +
										 "AB_CODIGO, " +
										 "AJ_QTDRESTR " +
										 "having AJ_QTDRESTR <= count(AB_CODIGO)",null);
		if (cursor.getCount() > 0)   
		 {
			cursor.close(); 
			return true;
		 }
		 else
		 {
			 cursor.close();
			 return false;
		 }			
	}

	public boolean hwsaperguntafoirespondida(String hwsplaca, String hwspergunta) 
	{
		Cursor cursor = this.db.rawQuery("select " +
										 "distinct " +
										 "BB_PERGUNTA " +
										 "from " +
										 "checklistsrealizados " +
										 " where " +
										 "BB_PLACA = '"+hwsplaca+"' and " +
										 "BB_PERGUNTA = '"+hwspergunta+"'",null);
		if (cursor.getCount() > 0)   
		 {
			cursor.close(); 
			return true;
		 }
		 else
		 {
			 cursor.close();
			 return false;
		 }			
	}

	public ArrayList<HashMap<String, String>>  selectchecklistspendentesounaosincronizados() 
	{
		ArrayList<HashMap<String, String>> hwschecklists = new ArrayList<HashMap<String, String>>();
		Cursor cursor = this.db.rawQuery("select " +
										"distinct " +
										"BB_PLACA, " +
										"BA_DESC " +
										"from " +
										"checklistsrealizados " +
										"inner join veiculos on BA_PLACA = BB_PLACA ",null);
		if (cursor.moveToFirst()) 
		{
			do 
			{
				HashMap<String, String> hwsregistrodadoscheck = new HashMap<String, String>();
				hwsregistrodadoscheck.put("BB_PLACA", 		cursor.getString(0));
				hwsregistrodadoscheck.put("BA_DESC", 		hwscapitalizar(cursor.getString(1)));
				hwschecklists.add(hwsregistrodadoscheck);
			} 
				while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwschecklists;			
	}

	
	public ArrayList<HashMap<String, String>>  selectperguntaspai(String hwstipoimplemento) 
	{
		
		ArrayList<HashMap<String, String>> hwsdadosperguntas = new ArrayList<HashMap<String, String>>();
		Cursor cursor = this.db.rawQuery("select " +
										 "distinct " +
										 "P.AD_CODIGO," +
										 "P.AD_PERGUNTA," +
										 "P.AD_TIPO " +
										 "from " +
										 "perguntasdochecklist as P " +
										 "where " +
										 "P.AA_CODERP = '"+hwstipoimplemento+"' and " +
										 "P.AD_CODIGO not in " +
										 "(" +
										 "select " +
										 "distinct  " +
										 "F.AG_PERFILHA " +
										 "from " +
										 "perguntasdochecklist as F " +
										 "where " +
										 "F.AG_PERFILHA <> '' and  " +
										 "F.AA_CODERP = '"+hwstipoimplemento+"') " +
										 "order by " +
										 "P.AD_CODIGO",null);
		if (cursor.moveToFirst()) 
		{
			do 
			{
				HashMap<String, String> hwsregistrodadosperguntas = new HashMap<String, String>();
				hwsregistrodadosperguntas.put("AD_CODIGO", 		cursor.getString(0));
				hwsregistrodadosperguntas.put("AD_PERGUNTA", 	cursor.getString(1));
				hwsregistrodadosperguntas.put("AD_TIPO", 		cursor.getString(2));
				
				hwsdadosperguntas.add(hwsregistrodadosperguntas);
			} 
				while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwsdadosperguntas;			
	}
	
	public ArrayList<HashMap<String, String>>  selectrespostas(String hwstipoimplemento, String hwspergunta) 
	{
		
		ArrayList<HashMap<String, String>> hwsdadosrespostas = new ArrayList<HashMap<String, String>>();
		Cursor cursor = this.db.rawQuery("select distinct " +
										"AD_CODIGO," +
										"AF_CODIGO," +
										"AF_RESPOSTA, " +
										"AH_ID " +
										"from " +
										"perguntasdochecklist " +
										"where " +
										"AA_CODERP = '" + hwstipoimplemento + "' and " +
										"AD_CODIGO = '" + hwspergunta + "'",null);
		if (cursor.moveToFirst()) 
		{
			do 
			{
				HashMap<String, String> hwsregistrodadosrespostas = new HashMap<String, String>();
				hwsregistrodadosrespostas.put("AD_CODIGO", 		cursor.getString(0));
				hwsregistrodadosrespostas.put("AF_CODIGO", 		cursor.getString(1));
				hwsregistrodadosrespostas.put("AF_RESPOSTA", 	cursor.getString(2));
				hwsregistrodadosrespostas.put("AH_ID", 			cursor.getString(3));
				
				hwsdadosrespostas.add(hwsregistrodadosrespostas);
			} 
				while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwsdadosrespostas;			
	}
	
	public ArrayList<HashMap<String, String>>  selectperguntasfilhas(String hwspergunta, String hwsresposta) 
	{
		
		ArrayList<HashMap<String, String>> hwsdadosrespostas = new ArrayList<HashMap<String, String>>();
		Cursor cursor = this.db.rawQuery("select " +
										 "distinct " +
										 "P.AD_CODIGO, " +
										 "P.AD_PERGUNTA, " +
										 "P.AD_TIPO " + 
										 "from " +
										 "perguntasdochecklist as P " +
										 "where " +
										 "P.AD_CODIGO in " +
										 "(" +
										 "select " +
										 "distinct " +
										 "F.AG_PERFILHA  " +
										 "from " +
										 "perguntasdochecklist as F " +
										 "where " +
										 "F.AD_CODIGO = '"+hwspergunta+"' and "  +
										 "F.AF_CODIGO = '" + hwsresposta + "' " +
										 ") " +
										 " order by " +
										 "P.AF_CODIGO",null);
		if (cursor.moveToFirst()) 
		{
			do 
			{
				HashMap<String, String> hwsregistrodadosrespostas = new HashMap<String, String>();
				hwsregistrodadosrespostas.put("AD_CODIGO", 		cursor.getString(0));
				hwsregistrodadosrespostas.put("AD_PERGUNTA", 	cursor.getString(1));
				hwsregistrodadosrespostas.put("AD_TIPO", 		cursor.getString(2));
				
				hwsdadosrespostas.add(hwsregistrodadosrespostas);
			} 
				while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwsdadosrespostas;			
	}
	
	public ArrayList<HashMap<String, String>>  selectperguntasfilhasparaexclusao(String hwspergunta) 
	{
		
		ArrayList<HashMap<String, String>> hwsdadosrespostasexclusao = new ArrayList<HashMap<String, String>>();
		Cursor cursor = this.db.rawQuery("select " +
										 "distinct " +
										 "P.AD_CODIGO, " +
										 "P.AD_PERGUNTA, " +
										 "P.AD_TIPO " + 
										 "from " +
										 "perguntasdochecklist as P " +
										 "where " +
										 "P.AD_CODIGO in " +
										 "(" +
										 "select " +
										 "distinct " +
										 "F.AG_PERFILHA  " +
										 "from " +
										 "perguntasdochecklist as F " +
										 "where " +
										 "F.AD_CODIGO = '"+hwspergunta+"' "  +
										 ") " +										 
										 "order by " +
										 "P.AF_CODIGO",null);
		if (cursor.moveToFirst()) 
		{
			do 
			{
				HashMap<String, String> hwsregistrodadosrespostasexclusao = new HashMap<String, String>();
				hwsregistrodadosrespostasexclusao.put("AD_CODIGO", 		cursor.getString(0));
				hwsregistrodadosrespostasexclusao.put("AD_PERGUNTA", 	cursor.getString(1));
				hwsregistrodadosrespostasexclusao.put("AD_TIPO", 		cursor.getString(2));
				
				hwsdadosrespostasexclusao.add(hwsregistrodadosrespostasexclusao);
			} 
				while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwsdadosrespostasexclusao;			
	}
	
	public int selectmaxidveiculos()
	{
		int hwsresultado = 0;
		Cursor cursor = this.db.rawQuery("select max(BA_ID) as BA_ID from veiculos",null);		
		if (cursor.moveToFirst()) 
		{
			do 
			{
				hwsresultado = (int) cursor.getLong(0);
			} 
				while (cursor.moveToNext());
			}
			if (cursor != null && !cursor.isClosed()) 
			{
				cursor.close();
		}
		return hwsresultado;
	}
	
	
	public static String hwscapitalizar( String s ) 
    { 
		s = s.toLowerCase();
		
    	for (int i = 0; i < s.length(); i++) 
    	{ 
    		if (i == 0) 
    		{ 
    			//Capitalize the first letter of the string. 
    			s = String.format( "%s%s", 
    			Character.toUpperCase(s.charAt(0)), 
    			s.substring(1) ); 
    		} 

    		// Is this character a non-letter or non-digit?  If so 
    		// then this is probably a word boundary so let's capitalize 
    		// the next character in the sequence. 
    		if (!Character.isLetterOrDigit(s.charAt(i))) 
    		{ 
    			if (i + 1 < s.length()) 
    			{ 
    				s = String.format( "%s%s%s", 
    									s.subSequence(0, i+1), 
    									Character.toUpperCase(s.charAt(i + 1)), 
    									s.substring(i+2) ); 
    			} 
    		} 
    	} 

    	return s; 

    }
	
	public boolean existechecklistsemsincronizacao()
	{
		Cursor cursor = this.db.rawQuery("select count(BB_PLACA) as BB_PLACA from checklistsrealizados", null);
		boolean hwsresultcursor = false;
		if (cursor.moveToFirst()) 
		{
			do 
			{
				if (cursor.getInt(0) > 0)
				{
					hwsresultcursor = true;
				}
				else
				{
					hwsresultcursor = false;
				}
			} 
			while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwsresultcursor;		 
	}
	
	public boolean existecadastrodeveiculos()
	{
		Cursor cursor = this.db.rawQuery("select count(BA_PLACA) as BA_PLACA from veiculos", null);
		boolean hwsresultcursor = false;
		if (cursor.moveToFirst()) 
		{
			do 
			{
				if (cursor.getInt(0) > 0)
				{
					hwsresultcursor = true;
				}
				else
				{
					hwsresultcursor = false;
				}
			} 
			while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwsresultcursor;		 
	}
	
	public boolean existecadastrodeperguntas()
	{
		Cursor cursor = this.db.rawQuery("select count(A9_CODIGO) as A9_CODIGO from perguntasdochecklist", null);
		boolean hwsresultcursor = false;
		if (cursor.moveToFirst()) 
		{
			do 
			{
				if (cursor.getInt(0) > 0)
				{
					hwsresultcursor = true;
				}
				else
				{
					hwsresultcursor = false;
				}
			} 
			while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwsresultcursor;		 
	}

	public boolean perguntaerespostareprovacao(String hwstipoimplemento, String hwspergunta, String hwsidresposta)
	{
		Cursor cursor = this.db.rawQuery("select " +
										"distinct " +
										"AI_CODPER " +
										"from " +
										"perguntasdochecklist " +
										"where " +
										"AA_CODERP = '"+hwstipoimplemento+"' and " +
										"AD_CODIGO = '"+hwspergunta+"' and " +
										"AH_ID = '"+hwsidresposta+"' and " +
										"AI_CODPER = '"+hwspergunta+"' ",null); 
		 if (cursor.getCount() > 0)   
		 {
			cursor.close(); 
			return true;
		 }
		 else
		 {
			 cursor.close();
			 return false;
		 }		 
	}
	
	public boolean existeperguntaerespostareprovacao(String hwstipoimplemento, String hwsplaca)
	{
		Cursor cursor = this.db.rawQuery("select " +
										"BB_ID " +
										"from " +
										"checklistsrealizados " +
										"where " +
										"BB_PLACA = '"+hwsplaca+"' and " +
										"BB_ID in ( " +
										"select " +
										"AH_ID " +
										"from " +
										"perguntasdochecklist " +
										"where " +
										"AA_CODERP = '"+hwstipoimplemento+"' and " +
										"AI_CODPER <> '')",null); 
		 if (cursor.getCount() > 0)   
		 {
			cursor.close(); 
			return true;
		 }
		 else
		 {
			 cursor.close();
			 return false;
		 }		 
	}
	
	public ArrayList<HashMap<String, String>> descricaodaperguntaerespostadareprovacao(String hwstipoimplemento, String hwspergunta, String hwsidresposta)
	{
		ArrayList<HashMap<String, String>> hwsdadosrespostasexclusao = new ArrayList<HashMap<String, String>>();
		Cursor cursor = this.db.rawQuery("select " +
										"distinct " +
										"AD_PERGUNTA, " +
										"AF_RESPOSTA " +
										"from " +
										"perguntasdochecklist " +
										"where " +
										"AA_CODERP = '"+hwstipoimplemento+"' and " +
										"AD_CODIGO = '"+hwspergunta+"' and " +
										"AH_ID = '"+hwsidresposta+"' and " +
										"AI_CODPER = '"+hwspergunta+"' ",null);
		if (cursor.moveToFirst()) 
		{
			do 
			{
				HashMap<String, String> hwsregistrodadosrespostasexclusao = new HashMap<String, String>();
				hwsregistrodadosrespostasexclusao.put("AD_PERGUNTA", 	cursor.getString(0));
				hwsregistrodadosrespostasexclusao.put("AF_RESPOSTA", 	cursor.getString(1));
				
				hwsdadosrespostasexclusao.add(hwsregistrodadosrespostasexclusao);
			} 
				while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwsdadosrespostasexclusao;					
	}

	public ArrayList<HashMap<String, String>> hwsselectchecklist(String hwsplaca)
	{
		ArrayList<HashMap<String, String>> hwsdadosselectchecklist = new ArrayList<HashMap<String, String>>();
		Cursor cursor = this.db.rawQuery("select " +
										"BB_PLACA, " +
										"BB_PERGUNTA," +
										"BB_ID,  " +
										"(select distinct A9_CODIGO from perguntasdochecklist) as A9_CODIGO, " +
										"BB_OBS, " +
										"BB_STATUS, " +
										"BB_CODUSER " + 
										"from " +
										"checklistsrealizados " +
										"where " +
										"BB_PLACA = '"+hwsplaca+"'",null);
		if (cursor.moveToFirst()) 
		{
			do 
			{
				HashMap<String, String> hwsdadosselectchecklisthashmap = new HashMap<String, String>();
				hwsdadosselectchecklisthashmap.put("BB_PLACA", 		cursor.getString(0));
				hwsdadosselectchecklisthashmap.put("BB_PERGUNTA", 	cursor.getString(1));
				hwsdadosselectchecklisthashmap.put("BB_ID", 		cursor.getString(2));
				hwsdadosselectchecklisthashmap.put("A9_CODIGO", 	cursor.getString(3));
				hwsdadosselectchecklisthashmap.put("BB_OBS", 		cursor.getString(4));
				hwsdadosselectchecklisthashmap.put("BB_STATUS", 	cursor.getString(5));
				hwsdadosselectchecklisthashmap.put("BB_CODUSER", 	cursor.getString(6));
				
				hwsdadosselectchecklist.add(hwsdadosselectchecklisthashmap);
			} 
				while (cursor.moveToNext());
		}
		if (cursor != null && !cursor.isClosed()) 
		{
			cursor.close();
		}
		return hwsdadosselectchecklist;					
	}
	
	public boolean respostajagravadanobanco(String hwsplaca, String hwsidresposta)
	{
		Cursor cursor = this.db.rawQuery("select BB_ID from checklistsrealizados where BB_PLACA = '"+hwsplaca+"' and BB_ID = '"+hwsidresposta+"'", null); 
		 if (cursor.getCount() > 0)   
		 {
			cursor.close(); 
			return true;
		 }
		 else
		 {
			 cursor.close();
			 return false;
		 }		 
	}
	
	public boolean excluirespostasdaperguntaunicas(String hwspergunta, String hwsplaca)
	{
		this.db.execSQL("delete from checklistsrealizados where BB_PLACA = '"+hwsplaca+"' and BB_PERGUNTA = '"+hwspergunta+"'");
		return true;
	}
	
	public boolean excluichecklistjarealizado(String hwsplaca)
	{
		this.db.execSQL("delete from checklistsrealizados where BB_PLACA = '"+hwsplaca+"'");
		return true;
	}

	public boolean excluirespostasdaperguntamultiplas(String hwspergunta, String hwsplaca, String hwsidresposta)
	{
		this.db.execSQL("delete from checklistsrealizados where BB_PLACA = '"+hwsplaca+"' and BB_PERGUNTA = '"+hwspergunta+"' and BB_ID = '"+hwsidresposta+"'");
		return true;
	}
	
	public boolean hwsexisteusuarios()
	{	    
	    Cursor cursor = db.rawQuery("select count(*) from usuarios ", null);
	    if (!cursor.moveToFirst())
	    {
	        return false;
	    }
	    int count = cursor.getInt(0);
	    cursor.close();
	    return count > 0;
	}		
	
	public boolean hwsusuarioesenhacorreta(String hwsusuario, String hwssenha)
	{	    
	    Cursor cursor = db.rawQuery("select count(*) from usuarios where HI_USER = '" + hwsusuario + "' and HI_SENHA = '" + hwssenha + "'" , null);
	    if (!cursor.moveToFirst())
	    {
	        return false;
	    }
	    int count = cursor.getInt(0);
	    cursor.close();
	    return count > 0;
	}
	
	public String hwsretornacodigodousuario(String hwsusuario)
	{	    
	    Cursor cursor = db.rawQuery("select HI_CODIGO from usuarios where HI_USER = '" + hwsusuario + "'" , null);
	    if (!cursor.moveToFirst())
	    {
	        return "";
	    }
	    String hwscodusr = cursor.getString(0);
	    cursor.close();
	    return hwscodusr;
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
	
	private static class OpenHelper extends SQLiteOpenHelper 
	{

		OpenHelper(Context context) 
		{
			super(context, DATABASE_NAME, null, DATABASE_VERSION);
		}

		@Override
		public void onCreate(SQLiteDatabase db) 
		{
			db.execSQL("CREATE TABLE perguntasdochecklist " + 
					   "(" +
					   "A9_CODIGO TEXT," +
					   "A9_DESC TEXT,"  +
					   "AA_CODIGO TEXT, " +
					   "AA_CODERP TEXT, " +
					   "AA_DESC TEXT," +
					   "AB_CODIGO TEXT," +
					   "AB_DESC TEXT," +
					   "AD_CODIGO TEXT," +
					   "AD_PERGUNTA TEXT," +
					   "AF_CODIGO TEXT, " +
					   "AF_RESPOSTA TEXT," +
					   "AG_PERFILHA TEXT," +
					   "AI_CODPER TEXT," +
					   "AJ_QTDRESTR TEXT," +
					   "AH_ID TEXT,"+
					   "AD_TIPO TEXT)");
			
			db.execSQL("CREATE TABLE veiculos " + 
					   "(" +
					   "BA_PLACA TEXT," +
					   "BA_DESC TEXT, " +
					   "BA_TIPO TEXT, " +
					   "BA_ID   NUMERIC)");
			
			db.execSQL("CREATE TABLE checklistsrealizados " + 
					   "(" +
					   "BB_PLACA 	TEXT," +
					   "BB_PERGUNTA TEXT, "+
					   "BB_ID 		TEXT, "+
					   "BB_OBS		TEXT, "+
					   "BB_STATUS 	TEXT," +
					   "BB_CODUSER  TEXT)");
			
			db.execSQL("CREATE TABLE usuarios " + 
					   "(" +
					   "HI_CODIGO 	TEXT," +
					   "HI_NOME     TEXT, "+
					   "HI_EMAIL 	TEXT, "+
					   "HI_USER		TEXT, "+
					   "HI_SENHA 	TEXT, "+
					   "HI_RESENHA	TEXT)");
		}

		@Override
		public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) 
		{
			db.beginTransaction();
			try 			
			{
				
				/// Pergunta do CheckList
				
				if (isTableExists(db, "perguntasdochecklist"))
				{
					if (isTableExists(db, "perguntasdochecklist_copia"))
					{
						db.execSQL("DROP TABLE perguntasdochecklist_copia");
					}
					db.execSQL("CREATE TABLE perguntasdochecklist_copia AS SELECT * FROM perguntasdochecklist");
				}
				if (isTableExists(db, "perguntasdochecklist"))
				{
					db.execSQL("drop table perguntasdochecklist");
				}
				
				// CheckLists Realizados
				
				if (isTableExists(db, "checklistsrealizados"))
				{
					if (isTableExists(db, "checklistsrealizados_copia"))
					{
						db.execSQL("DROP TABLE checklistsrealizados_copia");
					}
					db.execSQL("CREATE TABLE checklistsrealizados_copia AS SELECT * FROM checklistsrealizados");
				}
				if (isTableExists(db, "checklistsrealizados"))
				{
					db.execSQL("drop table checklistsrealizados");
				}
				
				// Veiculos
				
				if (isTableExists(db, "veiculos"))
				{
					if (isTableExists(db, "veiculos_copia"))
					{
						db.execSQL("DROP TABLE veiculos_copia");
					}
					db.execSQL("CREATE TABLE veiculos_copia AS SELECT * FROM veiculos");
				}
				if (isTableExists(db, "veiculos"))
				{
					db.execSQL("drop table veiculos");
				}
				
				// Usuarios
				
				if (isTableExists(db, "usuarios"))
				{	
					if (isTableExists(db, "usuarios_copia"))							
					{
						db.execSQL("DROP TABLE usuarios_copia");
					}
					db.execSQL("CREATE TABLE usuarios_copia AS SELECT * FROM usuarios");
				}
				if (isTableExists(db, "usuarios"))
				{
					db.execSQL("drop table usuarios");
				}
				//
				onCreate(db); // Chama o on Create para recriar as tabelas
				// Repassando as copias das tabelas
				if (isTableExists(db, "perguntasdochecklist_copia"))
				{
					String hwssqlinsert =  hwsretornainsertinto(db, "perguntasdochecklist", "perguntasdochecklist_copia");
					db.execSQL(hwssqlinsert);
				}
				if (isTableExists(db, "checklistsrealizados_copia"))
				{
					String hwssqlinsert =  hwsretornainsertinto(db, "checklistsrealizados", "checklistsrealizados_copia");
					db.execSQL(hwssqlinsert);
				}
				if (isTableExists(db, "veiculos_copia"))
				{
					String hwssqlinsert =  hwsretornainsertinto(db, "veiculos", "veiculos_copia");
					db.execSQL(hwssqlinsert);
				}
				if (isTableExists(db, "usuarios_copia"))
				{
					String hwssqlinsert =  hwsretornainsertinto(db, "usuarios", "usuarios_copia");
					db.execSQL(hwssqlinsert);
				}
				db.setTransactionSuccessful();				
			} 
			finally
			{
				db.endTransaction();
			}			
		}
		
		boolean isTableExists(SQLiteDatabase db, String tableName)
		{
		    if (tableName == null || db == null || !db.isOpen())
		    {
		        return false;
		    }
		    Cursor cursor = db.rawQuery("select count(*) from sqlite_master where type = ? and name = ?", new String[] {"table", tableName});
		    if (!cursor.moveToFirst())
		    {
		        return false;
		    }
		    int count = cursor.getInt(0);
		    cursor.close();
		    return count > 0;
		}		
		
		String hwsretornainsertinto(SQLiteDatabase db, String hwstabela, String hwstabela_copia)
		{
			ArrayList<String> hwscampostabela = new ArrayList<String>(); 
			Cursor cursor_tabela = db.rawQuery("PRAGMA table_info("+hwstabela+")", null);
			if ( cursor_tabela.moveToFirst() ) {
				do 
				{
					hwscampostabela.add(cursor_tabela.getString(1));	
				} while (cursor_tabela.moveToNext());
			}
			cursor_tabela.close();
			ArrayList<String> hwscampostabela_copia = new ArrayList<String>(); 
			Cursor cursor_tabela_copia = db.rawQuery("PRAGMA table_info("+hwstabela_copia+")", null);
			if ( cursor_tabela_copia.moveToFirst() ) {
				do 
				{
					hwscampostabela_copia.add(cursor_tabela_copia.getString(1));	
				} while (cursor_tabela_copia.moveToNext());
			}
			cursor_tabela_copia.close();
			ArrayList<String> for_hwscampostabela_copia = hwscampostabela_copia; 
			// Veirificando se um campo foi excluido na tabela original
			for (int i = 0; i < for_hwscampostabela_copia.size(); i++) 
			{
				int hws_index_hwscampostabela = hwscampostabela.indexOf(for_hwscampostabela_copia.get(i));
				
				if (hws_index_hwscampostabela == -1)
				{
					hwscampostabela_copia.remove(i);
					i = i - 1;
				}
				
			}
			// Verificando se um campo foi incluido na tabela original
			ArrayList<String> for_hwscampostabela = hwscampostabela;
			for (int i = 0; i < for_hwscampostabela.size(); i++) 
			{
				int hws_index_hwscampostabela_copia = hwscampostabela_copia.indexOf(for_hwscampostabela.get(i));
				
				if (hws_index_hwscampostabela_copia == -1)
				{
					hwscampostabela_copia.add(i, "null as " + for_hwscampostabela.get(i));
				}				
			}
			String hwsinstrucaosql_hwscampostabela = "";
			hwsinstrucaosql_hwscampostabela = hwscampostabela.toString();
			hwsinstrucaosql_hwscampostabela = hwsinstrucaosql_hwscampostabela.replace("[", "(");
			hwsinstrucaosql_hwscampostabela = hwsinstrucaosql_hwscampostabela.replace("]", ")");
			
			String hwsinstrucaosql_hwscampostabela_copia = "";
			hwsinstrucaosql_hwscampostabela_copia = hwscampostabela_copia.toString();
			hwsinstrucaosql_hwscampostabela_copia = hwsinstrucaosql_hwscampostabela_copia.replace("[", "");
			hwsinstrucaosql_hwscampostabela_copia = hwsinstrucaosql_hwscampostabela_copia.replace("]", "");
			
			String hwsinstrucaosql = "";
			
			hwsinstrucaosql = "insert into " + hwstabela + " " + hwsinstrucaosql_hwscampostabela + " select " + hwsinstrucaosql_hwscampostabela_copia + " from " + hwstabela_copia;
			
			return hwsinstrucaosql;
		}
		
	}
}
