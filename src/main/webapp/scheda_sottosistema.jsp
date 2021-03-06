<%@ include file="params.jsp"
%><%@ include file="c_java.jsp"
%><%@ include file="apriDbConn.jsp"
%><%

int id_sottosistema = 1;

if (request.getParameter("id")!=null){ 
	if (!request.getParameter("id").equals("")) {
		try {
			id_sottosistema = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException nfe) {
			// catch exception if id isn't integer
			id_sottosistema = 0;
		}
	}
}

String stmt_Sql = "SELECT * FROM ped_user.ped_v_sottosistemi WHERE id_sottosistema BETWEEN 1 AND 91 AND id_sottosistema ='" + id_sottosistema + "'";
ResultSet rs = null;
ResultSet rs3 = null;

try
{
	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(stmt_Sql);
	rs.next();
		if (rs.getRow() == 0) {
			title = "Unit&agrave; cartografica&nbsp; - Carta dei suoli alla scala 1:250.000";
			pageHeader = "Carta dei suoli alla scala 1:250.000";
			%>
		
			<%@ include file="head.jsp"
			%>
				<ul class="skip">
				<li><a href="#homepage" title="Torna alla Pagina Principale - accesskey h">Torna alla Pagina Principale [h]</a> </li>
				<li><a href="#contenutopagina" title="Salta ai contenuti - accesskey k" accesskey="k">Salta ai contenuti [k]</a> </li>
				<li><a href="#cerca" title="Salta al form di ricerca  - accesskey c">Cerca nel sito [c]</a> </li>
				</ul>
				<%@ include file="testata.jsp"
			%>
			</div>
			<div class="briciole">
			<a name="homepage" tabindex="0"></a>
			<a accesskey="h" href="index.jsp?liv=3" title="Torna alla pagina principale">Home Page</a>
				&#8250;&#8250; <a href="legenda.jsp?liv=3" title="torna alla legenda Carta dei suoli alla scala 1:250.000">Legenda carta dei suoli alla scala 1:250.000</a>&nbsp;
				&#8250;&#8250; Unit&agrave; cartografiche
			</div>
			<div class="uc_01">
				<a name="contenutopagina" tabindex="0"></a>
				<p id="msg_error">L'unit&agrave; cartografica richiesta non &egrave; valida.<br/><br/>
				<a href="legenda.jsp?liv=3" title="Torna alla legenda Carta dei suoli al livello di dettaglio 1:250.000">Torna alla LEGENDA Carta dei suoli al livello di dettaglio 1:250.000</a>
				</p>
			</div>
	<%
	
	} else {
		//id_sottosistema = rs.getString("id_sottosistema");
		title = "Unit&agrave; cartografica&nbsp;"+rs.getString("etichetta") + " - Carta dei suoli alla scala 1:250.000";
		pageHeader = "Carta dei suoli alla scala 1:250.000";
	%>
	<%@ include file="head.jsp"
	%>
		<ul class="skip">
		<li><a href="#homepage" title="Torna alla Pagina Principale - accesskey h">Torna alla Pagina Principale [h]</a> </li>
		<li><a href="#contenutopagina" title="Salta ai contenuti - accesskey k" accesskey="k">Salta ai contenuti [k]</a> </li>
		<li><a href="#cerca" title="Salta al form di ricerca  - accesskey c">Cerca nel sito [c]</a> </li>
		<li><a href="#menu" title="Salta al menu principale - accesskey n" accesskey="n">Salta al menu principale [n]</a> </li>
		</ul>	
	<%@ include file="testata.jsp"
	%>
			<div id="quickSummary">
				<p class="p1"><span>Carta dei suoli alla scala 1:250.000, U.C. <%=rs.getString("etichetta")%>, <a href="#tit_01">l'ambiente</a></span></p>
				<p class="p2"><span>Carta dei suoli alla scala 1:250.000, U.C. <%=rs.getString("etichetta")%>, <a href="#tit_02">l'uso del suolo</a></span></p>
				<p class="p3"><span>Carta dei suoli alla scala 1:250.000, U.C. <%=rs.getString("etichetta")%>, <a href="#tit_03">il suolo</a></span></p>
				<p class="p3"><span>Carta dei suoli alla scala 1:250.000, U.C. <%=rs.getString("etichetta")%>, <a href="#tit_04">modello di distribuzione dei suoli nel paesaggio</a></span></p>
			</div>
		</div>
		<div class="briciole">
		<a name="homepage" tabindex="0"></a>
		<a accesskey="h" href="index.jsp?liv=3" title="Torna alla pagina principale">Home Page</a> &#8250;&#8250; <a href="legenda.jsp?liv=3" title="TTorna alla legenda Carta dei suoli al livello di dettaglio 1:250.000">Legenda carta dei suoli alla scala 1:250.000</a> &#8250;&#8250; U.C. <%=rs.getString("etichetta")%></div>
			<div class="uc_01">
				<div id="box_titolo_uc">
				<div class="titolo_uc">
					<h1>Unit� cartografica <%=rs.getString("etichetta")%></h1>
				</div>
				<div class="menu_uc">
					<a name="menu" tabindex="0"></a>
					<ul>
						<li><a href="#tit_01" title="L'ambiente">l'ambiente</a></li>
						<li><a href="#tit_02" title="L'uso del suolo">l'uso del suolo</a></li>
						<li><a href="#tit_03" title="I suoli">i suoli</a></li>
						<li><a href="#tit_04" title="I principali tipologie di suolo">i principali tipologie di suolo</a></li>
					</ul>
				</div>
			</div>
			<div id="box_descr_uc">
				<img src="<%=pathImg%>/sottosistemi/Distribuzione_<%=rs.getString("etichetta")%>.gif"
					width ="200" height="107"
					alt="Distribuzione cartografica unit� cartografica <%=rs.getString("etichetta")%>"
				/>
				<p class="box_descr"><%=aCapo(rs.getString("descrizione"))%></p>
			</div>
		</div>
	<%
	try
	{
		stmt_Sql = "SELECT * FROM ped_user.ped_v_immagini_sottosistemi WHERE id_sottosistema=" +id_sottosistema;
		Statement stm3 = dbConn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		rs3 = stm3.executeQuery(stmt_Sql);
		String thisPage="";
		String didaCurrent="";
		rs3.last();
		int numberOfRows = rs3.getRow();
		int currentIm=0;
		short i;
		if (numberOfRows>0) {
			rs3.first();
			currentIm=1;
			if (request.getParameter("im")!=null){ 
				if (!request.getParameter("im").equals("")) {
					currentIm=Integer.parseInt(request.getParameter("im"));
				}
			}
			%>
			<div class="uc_02">
			<div class="img_uc">
			<%
			for (i = 1; i<= numberOfRows; i++) {
				if (i == currentIm) {
					 didaCurrent = rs3.getString("DIDASCALIA");
				}
			%>
				<div class="thumbwrapper" 
				<% if (i != currentIm) { %> style="display:none;" <%}%>
				>
					<a href="<%=pathImg%>/paesaggi/<%=rs3.getString("IMMAGINE")%>.jpg" class="highslide" onkeypress="if (event.keyCode == 13) { return hs.expand(this, galleryOptions)}" onclick="return hs.expand(this, galleryOptions)" title="Click per ingrandire">
					<img src="<%=pathImg%>/paesaggi/<%=rs3.getString("IMMAGINE")%>_200.jpg" width ="200" height="137" alt="<%=rs3.getString("DIDASCALIA")%>" /></a>
					<div class="highslide-caption">
						<%=rs3.getString("DIDASCALIA")%>
					</div>
				</div>
			<%
				if (i < numberOfRows) {
					rs3.next();
				}
			}

		%>

				<p class="didascalia"><%=aCapo(didaCurrent)%></p>
				<noscript><p class="didascalia">Per visualizzare gli effetti grafici della photogallery dinamica, � necessario avere Javascript abilitato.</p></noscript>
	<%		if(numberOfRows>1) {
	%>
				<table class="foto_scorr">
		  <tr>
			<td class="fr_sx">
			<%		if (currentIm>1) { 
				thisPage = request.getServletPath().replace("/","") + "?id=" + request.getParameter("id") + "&im=" + (currentIm-1);
	%>      
		  <a href="<%=thisPage%>" title="Immagine precedente">&#8249;&#8249;</a>
	<%		}
	%>
			</td>
			<td class="fr_center">
			  foto: <%=currentIm%> di <%=numberOfRows%>
			</td>
			<td class="fr_dx">
	<%		if (currentIm<numberOfRows) { 
				thisPage = request.getServletPath().replace("/","") + "?id=" + request.getParameter("id") + "&im=" + (currentIm+1);
	%>     
		  <a href="<%=thisPage%>" title="Immagine successiva">&#8250;&#8250;</a>
	<%		}
	%>
			</td>
		  </tr>
		</table>
	<%		}
	%>
	  </div>

	<%	}

			rs3.close();
			stm3.close();
		} catch(Exception ee3) {
			out.println(ee3.getMessage());
			ee3.printStackTrace();
		}

	%>			
				
			<a name="contenutopagina" tabindex="0"></a>
			<a name="tit_01"></a>
			<h2>L'ambiente</h2>
			<p>
				<%=aCapo(rs.getString("ambiente"))%>
			</p>
			<a name="tit_02"></a>
			<h2>L'uso del suolo</h2>
			<p>
				<%=aCapo(rs.getString("uso_suolo"))%>
			</p>
			<a name="tit_03"></a>
			<h2>I suoli</h2>
			<p>
				<%=aCapo(rs.getString("suoli"))%>
			</p>
			<a name="tit_04"></a>
			<h2>Modello di distribuzione dei suoli nel paesaggio</h2>
	<%

		ResultSet rs2 = null;

		try
		{
			String stmt_sql = "SELECT * FROM ped_user.ped_v_testi_sottosistemi WHERE id_sottosistema=" + id_sottosistema;
			Statement stm2 = dbConn.createStatement();
			rs2 = stm2.executeQuery(stmt_sql);

			while(rs2.next())
			{
	%>
			<p class="tipi_di_suolo">
				<a href="scheda_fasisuolo.jsp?id=<%=rs2.getString("id_suolo")%>&amp;uc=<%=rs.getString("etichetta")%>&amp;id_uc=<%=id_sottosistema%>&amp;liv=3"
					title="Visualizza scheda suoli <%=rs2.getString("nome_suolo")%>"><%=rs2.getString("nome_suolo")%></a>
				<br />
	<%
				double DbPerc=rs2.getDouble("sulvl");
				String Frequenza= "";
				if (DbPerc < 9.6)
					Frequenza = "subordinato";
				else if (DbPerc < 27.6)
					Frequenza = "poco frequente";
				else if (DbPerc <= 49.6)
					Frequenza = "moderatamente frequente";
				else if (DbPerc > 49.6)
					Frequenza = "molto frequente";
	%>
				<%=Frequenza + " " + (DbPerc*100) + "% ca. della superficie dell'Unit� Cartografica"%>
			</p>
	<%
			}
			rs2.close();
			stm2.close();
		} catch(Exception ee2) {
			out.println(ee2.getMessage());
			ee2.printStackTrace();
		}
	%>
			<p class="img_sattellite">
				<img src="<%=pathImg%>/sottosistemi/LS_<%=rs.getString("etichetta")%>.gif"
					width ="350" height="250"
					alt="Immagine da satellite"
				/>
			</p>
			<p class="didascalia_img_sattellite">
				<%=aCapo(rs.getString("unita_associate"))%>
			</p>
	<%
		if (!(rs.getString("subordinate")==null))
		{
			if (!rs.getString("subordinate").equals(""))
			{
	%>
			<p class="tipi_di_suolo">
				Sono inoltre presenti con diffusione localizzata i seguenti tipi di suolo:<br />
				<%=aCapo(rs.getString("subordinate"))%>
			</p>
	<%
			}
		}
	%>
		</div>

	<%
		rs.close();
		stm.close();
	} 
} catch(Exception ee) {
	out.println(ee.getMessage());
	ee.printStackTrace();
}
%><%@ include file="chiudiDbConn.jsp"
%><%@ include file="footer.htm"
%>
