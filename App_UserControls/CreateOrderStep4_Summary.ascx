<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateOrderStep4_Summary.ascx.cs" Inherits="ZASshop.NET.App_UserControls.CreateOrderStep4_Summary" EnableViewState="false" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
                    <asp:Panel ID="pErrorMessage" runat="server" CssClass="pageCustomError" Visible="false" />

				

				<!-- order -->
				<div class="order">

				    <div class="cartButtons order-buttons">
                        <div class="cartButtons-desc">
                            <asp:Literal ID="lNoOrderTop" runat="server" />
                        </div>
                        <asp:Button ID="btnBackTop" runat="server"
                            Text="<%$ Resources: Resource, StepBack %>" CssClass="button btn btn-default" 
                            OnClick="btnBack_Click" />
                        <asp:Button ID="btnContinueToSaveTop" runat="server" 
                            Text="<%$ Resources: Resource, BtnFinishAndSendOrder %>" class="button btn btn-basic" 
                            onclick="btnSaveOrder_Click" />
				    </div>



					<!-- orderBox -->
					<div class="orderBox">
						<h2 class="h1"><asp:Literal ID="Literal8" runat="server" Text="<%$ Resources: Resource, AddressSelected %>" /></h2>
						
						<div class="row">
							<div class="col-md-6">
								
								<div class="address addressInv order-box">
									<h2 class="h1"><asp:Literal ID="Literal14" runat="server" Text="<%$ Resources: Resource, InvoicesAddressUpper %>" />:</h2>

						            <div class="addresses">
		                                <div class="orderBox halfPage">
		                                        <h2 class="h1 order-summary"><%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/nazev")) %></h2>
									            <address>
										            <%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/ulice")) %>&nbsp;<%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/cislo_popisne")) %><br />
										            <%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/mesto")) %>&nbsp;<%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/psc")) %>,&nbsp;<%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/stat_txt")) %><br />
		                                            <br />
										            <asp:Literal ID="l2" runat="server" Text="<%$ Resources: Resource, AddressContact %>" />: <%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/kontaktni_osoba")) %>&nbsp;<%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/kontaktni_osoba_p")) %><br />
		                                            <%: !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/telefon"))) || !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/mobil"))) ? Resources.Resource.AddressPhone + ": " : "" %>
		                                            <%: !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/telefon"))) ? ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/telefon_preset")) : "" %>&nbsp;<%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/telefon")) %>
		                                            <%: !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/telefon"))) && !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/mobil")))  ? ", " : "" %>
		                                            <%: !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/mobil"))) ? ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/mobil_preset")) : "" %> <%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/mobil")) %><br />
		                                            <br />
		                                            <asp:Panel ID="pIcDic" runat="server">
		                                                <%: !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/ico"))) ? Resources.Resource.IC.ToString() + ": " + ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/ico")) : "" %>
		                                                <%: !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/dic"))) ? Resources.Resource.DIC.ToString() + ": " + ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("inv_address_items/inv_address_item/dic")) : "" %>
		                                            </asp:Panel>
									            </address>
		                                </div>
		                            </div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="address addressDel order-box">
									<h2 class="h1"><asp:Literal ID="Literal15" runat="server" Text="<%$ Resources: Resource, DeliveryAddressUpper %>" />:</h2>

						            <div class="addresses">
		                                <div class="orderBox halfPage">
		                                        <h2 class="h1 order-summary"><%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/nazev")) %></h2>
									            <address>
										            <%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/ulice")) %>&nbsp;<%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/cislo_popisne")) %><br />
										            <%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/mesto")) %>&nbsp;<%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/psc")) %>,&nbsp;<%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/stat_txt")) %><br />
		                                            <br />
										            <asp:Literal ID="Literal16" runat="server" Text="<%$ Resources: Resource, AddressContact %>" />: <%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/kontaktni_osoba")) %>&nbsp;<%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/kontaktni_osoba_p")) %><br />
		                                            <%: !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/telefon"))) || !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/mobil"))) ? Resources.Resource.AddressPhone + ": " : "" %>
		                                            <%: !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/telefon"))) ? ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/telefon_preset")) : "" %>&nbsp;<%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/telefon")) %>
		                                            <%: !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/telefon"))) && !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/mobil")))  ? ", " : "" %>
		                                            <%: !String.IsNullOrEmpty(ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/mobil"))) ? ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/mobil_preset")) : "" %> <%: ZASutility.MyUtility.GetStringXmlValue(xmlResXmlData.DocumentElement.SelectSingleNode("del_address_items/del_address_item/mobil")) %><br />
									            </address>
		                                </div>
		                            </div>
								</div>
							</div>
						</div>
						
					</div>
					<!-- /orderBox -->								
								
					<!-- orderBox -->
					<div class="orderBox">
						<h2 class="h1"><asp:Literal ID="lBasketTitle" runat="server" Text="<%$ Resources: Resource, BasketContentTitle %>" /></h2>

						<div class="table-responsive">
							<table class="orderTable table table-bordered table-condensed">

								<thead>
		                            <tr>
		                                <th class="productTitle"><strong><asp:Literal ID="lThBasketNomenName" runat="server" Text="<%$ Resources: Resource, BasketNomenName %>" /></strong></th>
		                                <th><strong><asp:Literal ID="lThBasketStockState" runat="server" Text="<%$ Resources: Resource, BasketStockState %>" /></strong></th>
                                        <th><strong><asp:Literal ID="lThBasketParams" runat="server" Text="<%$ Resources: Resource, BasketParams %>" /></strong></th>
									    <th class='alignRight <%# String.IsNullOrEmpty(ZASutility.MyUtility.GetSession("e_mail")) ? "hide-control" : "" %>'><asp:Literal ID="Weight" runat="server" Text="<%$ Resources: Resource, Weight %>" /></th>
									    <th><strong><asp:Literal ID="lThBasketQty" runat="server" Text="<%$ Resources: Resource, BasketQty %>" /></strong></th>

									    <th class="alignRight summary-price-row"><strong><asp:Literal ID="lThBasketPriceNoDph" runat="server" Text="<%$ Resources: Resource, BasketPriceNoDph %>" /></strong></th>
									    <th class="alignRight summary-price-row"><strong><asp:Literal ID="lThBasketPriceWithDph" runat="server" Text="<%$ Resources: Resource, BasketPriceWithDph %>" /></strong></th>
								    </tr>
								</thead>

								<tbody>
			                        <asp:Repeater ID="rBasketTable" runat="server" 
			                            OnItemDataBound="rBasketTable_ItemDataBound" >
			                            <ItemTemplate>
										<tr>
										        <td class="productTitle">
                                        			<asp:HiddenField ID="hfBasketId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id") %>' />
                                        			<asp:HiddenField ID="hfCena" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "cena") %>' />
                                        			<asp:HiddenField ID="hfDph" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "dph_anone") %>' />
                                        			<asp:HiddenField ID="hfSazbaDph" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "sazba_dph") %>' />
                                        			<asp:HiddenField ID="hfKoeficientDph" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "koeficient") %>' />
                                        			<asp:HiddenField ID="hfIdMeny" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id_meny") %>' />
                                        		    <asp:TextBox ID="tbQuantity" runat="server" Text='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "mnozstvi").ToString()) %>' MaxLength="3" Visible="false" />
                                        		   <a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>"><%# DataBinder.Eval(Container.DataItem, "nazev") %></a>
                                        		</td>
                                        		<td class="productParam">
                                                	<div class="avail"><%# DataBinder.Eval(Container.DataItem, "web_items_stav_skladu") %></div>
                                                </td>
                                                <td class="productParam">
                                                													<%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "atribut_1").ToString()) ? "<div><b>" + DataBinder.Eval(Container.DataItem, "atribut_1_nazev") + "</b>: " + DataBinder.Eval(Container.DataItem, "atribut_1") + "</div>" : "" %>
                                                													<%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "atribut_2").ToString()) ? "<div><b>" + DataBinder.Eval(Container.DataItem, "atribut_2_nazev") + "</b>: " + DataBinder.Eval(Container.DataItem, "atribut_2") + "</div>" : "" %>
                                                													<%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "atribut_3").ToString()) ? "<div><b>" + DataBinder.Eval(Container.DataItem, "atribut_3_nazev") + "</b>: " + DataBinder.Eval(Container.DataItem, "atribut_3") + "</div>" : "" %>
                                                												</td>
                                                <td class='alignRight <%# String.IsNullOrEmpty(ZASutility.MyUtility.GetSession("e_mail")) ? "hide-control" : "" %>'><%# Math.Round((decimal)ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "brutto_celkem"),2) %> <span class="text-lowercase"> Kg</span></td>
												<td><%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "mnozstvi").ToString())%> <span class="text-lowercase"><%# DataBinder.Eval(Container.DataItem, "mj") %></span></td>

												<td class="productPrice summary-price-row">
			                                        <span class="price">
			                                            <asp:Literal ID="lPriceWithoutDph" runat="server"></asp:Literal>
			                                            <asp:Literal ID="lPriceWithoutDphIdMeny" runat="server"></asp:Literal>
			                                        </span>
			                                    </td>
												<td class="productPrice summary-price-row">
			                                        <span class="price">
			                                            <asp:Literal ID="lPriceWithDph" runat="server"></asp:Literal>
			                                            <asp:Literal ID="lPriceWithDphIdMeny" runat="server"></asp:Literal>
			                                        </span>
			                                    </td>
											</tr>
			                            </ItemTemplate>
			                        </asp:Repeater>
		                        </tbody>

		                        <tfoot class="cart-sum-price">
									<tr>
										<td colspan="5"><strong><asp:Literal ID="Literal7" runat="server" Text="<%$ Resources: Resource, BasketSummary %>" />:</strong></td>
										<td class="productPrice summary-price-row">
	                                        <span class="price">
	                                            <strong>
	                                                <asp:Literal ID="lSummaryPriceWithoutDph" runat="server"></asp:Literal>
	                                                <asp:Literal ID="lSummaryPriceWithoutDphIdMeny" runat="server"></asp:Literal>
	                                            </strong>
	                                        </span>
	                                    </td>
										<td class="productPrice summary-price-row">
	                                        <span class="price">
	                                            <strong>
	                                                <asp:Literal ID="lSummaryPriceWithDph" runat="server"></asp:Literal>
	                                                <asp:Literal ID="lSummaryPriceWithDphIdMeny" runat="server"></asp:Literal>
	                                            </strong>
	                                        </span>
	                                    </td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
					<!-- /orderBox -->

					<!-- orderBox -->
                    <asp:Panel ID="pBasketTableServices" runat="server" CssClass="orderBox">
						<h2 class="h1"><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, BasketContentServiceTitle %>" /></h2>
										
						<table class="orderTable table table-bordered table-condensed">

							<thead>
	                            <tr>
								    <th class="productTitle"><strong><asp:Literal ID="Literal3" runat="server" Text="<%$ Resources: Resource, BasketServiceName %>" /></strong></th>
								    <th class="alignRight summary-price-row"><strong><asp:Literal ID="Literal5" runat="server" Text="<%$ Resources: Resource, BasketPriceNoDph %>" /></strong></th>
								    <th class="alignRight summary-price-row"><strong><asp:Literal ID="Literal6" runat="server" Text="<%$ Resources: Resource, BasketPriceWithDph %>" /></strong></th>
							    </tr>
						    </thead>
							<tbody>
		                        <asp:Repeater ID="rBasketTableServices" runat="server" >
		                            <ItemTemplate>
									<tr>
		                                    <td nowrap>
		                                        <%# DataBinder.Eval(Container.DataItem, "nazev") %>
		                                    </td>
											<td class="productPrice summary-price-row">
		                                        <span class="price">
		                                            <%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_bez_dph")))%> <%# GetFormatCurrency(DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %>
		                                        </span>
		                                    </td>
											<td class="productPrice summary-price-row">
		                                        <span class="price">
		                                            <%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_s_dph")))%> <%# GetFormatCurrency(DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %>
		                                        </span>
		                                    </td>
										</tr>
		                            </ItemTemplate>
		                        </asp:Repeater>
							</tbody>
							<tfoot class="cart-sum-price">
								<tr>
									<td><strong><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, BasketSummary %>" />:</strong></td>
									<td class="productPrice summary-price-row">
                                        <span class="price">
                                            <strong>
                                                <asp:Literal ID="lSummaryPriceServiceWithoutDph" runat="server"></asp:Literal>
                                                <asp:Literal ID="lSummaryPriceServiceWithoutDphIdMeny" runat="server"></asp:Literal>
                                            </strong>
                                        </span>
                                    </td>
									<td class="productPrice summary-price-row">
                                        <span class="price">
                                            <strong>
                                                <asp:Literal ID="lSummaryPriceServiceWithDph" runat="server"></asp:Literal>
                                                <asp:Literal ID="lSummaryPriceServiceWithDphIdMeny" runat="server"></asp:Literal>
                                            </strong>
                                        </span>
                                    </td>
								</tr>
							</tfoot>
                        </table>
                    </asp:Panel>

                    <div class="row">
                    	<div class="col-md-6">							
							<!-- orderBox -->
							<div class="orderBox halfPage wayOfDel order-box">
								<h2 class="h1"><asp:Literal ID="Literal4" runat="server" Text="<%$ Resources: Resource, WayOfDeliverySelected %>" /></h2>
												
								<table class="orderTable order-table-delivery">
									<tr>
										<td><asp:Literal ID="lDeliveryInfoName" runat="server" /></td>
									</tr>
									<tr>
										<td>
		                                    <asp:PlaceHolder ID="phDeliveryInfo" runat="server">
		                                        <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources: Resource, CreateOrderDateOfDelivery %>" />:
		                                        <asp:Literal ID="lDeliveryInfo" runat="server" />
		                                    </asp:PlaceHolder>
		                                </td>
									</tr>
								</table>
							</div>
							<!-- /orderBox -->
                    	</div>
                    	<div class="col-md-6">
                    		<!-- orderBox -->
                    		<div class="orderBox halfPage wayOfPay order-box">
                    			<h2 class="h1"><asp:Literal ID="Literal9" runat="server" Text="<%$ Resources: Resource, WayOfPaymentSelected %>" /></h2>
                    							
                    			<table class="orderTable">
                    				<tr>
                    					<td><asp:Literal ID="lPaymentInfoName" runat="server" /></td>
                    				</tr>
                    			</table>
                    		</div>
                    		<!-- /orderBox -->
                    	</div>
                    </div>
								

						
						
					<!-- orderBox -->
                    <asp:Panel ID="pOtherDataPanel" runat="server" CssClass="orderBox">
						<h2 class="h1"><asp:Literal ID="Literal11" runat="server" Text="<%$ Resources: Resource, OtherOrderData %>" /></h2>
										
                        <asp:Table ID="tblOtherData" runat="server" CssClass="orderTable table table-bordered table-condensed order-table-rest">
                            <asp:TableRow ID="tblRowKomplet">
                                <asp:TableHeaderCell CssClass="titleOtherData"><asp:Label ID="lKomplet" runat="server" Text="<%$ Resources: Resource, CreateOrderKomplet %>" /></asp:TableHeaderCell>
                                <asp:TableCell><asp:Literal ID="lOtherDataKomplet" runat="server" /></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblRowOrderNumber">
                                <asp:TableHeaderCell><asp:Label ID="Label1" runat="server" Text="<%$ Resources: Resource, CreateOrderYoursOrderNumber %>" /></asp:TableHeaderCell>
                                <asp:TableCell><asp:Literal ID="lOtherDataOrderNumber" runat="server" /></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblRowDesc">
                                <asp:TableHeaderCell><asp:Label ID="Label3" runat="server" Text="<%$ Resources: Resource, CreateOrderYoursDescription %>" /></asp:TableHeaderCell>
                                <asp:TableCell><asp:Literal ID="lOtherDataDescription" runat="server" /></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblRowBonus">
                                <asp:TableCell ColumnSpan="2">
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources: Resource, BonusForActOrder %>" />: <span class="bonusPrice"><asp:Literal ID="lBonusForActOrder" runat="server" /></span>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
					<!-- /orderBox -->

					<!-- orderBox -->
					<div class="orderBox boxHeader">
						<h2 class="h1"><asp:Literal ID="Literal12" runat="server" Text="<%$ Resources: Resource, OrdersPriceTotal %>" /></h2>
										
                        <asp:Table ID="tblFinal" runat="server" CssClass="orderTable finalPrice table table-bordered">
                            <asp:TableRow CssClass="cart-sum-price">
                                <asp:TableCell ColumnSpan="2" />
                                <asp:TableCell CssClass="summary-price-row"><asp:Literal ID="lTotalPriceWithoutDph" runat="server" />&nbsp;<asp:Literal ID="lTotalPriceWithoutDphIdMeny" runat="server" /></asp:TableCell>
                                <asp:TableCell CssClass="summary-price-row"><asp:Literal ID="lTotalPriceWithDph" runat="server" />&nbsp;<asp:Literal ID="lTotalPriceWithDphIdMeny" runat="server" /></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblRowBonusRecap">
                                <asp:TableCell ColumnSpan="2"><asp:Literal ID="Literal13" runat="server" Text="<%$ Resources: Resource, WayOfPaymentByBonusFinal %>" />:</asp:TableCell>
                                <asp:TableCell><asp:Literal ID="lBonusRecap" runat="server" /></asp:TableCell>
                                <asp:TableCell />
                            </asp:TableRow>
                            <asp:TableRow ID="tblRowFinal">
                                <asp:TableCell ColumnSpan="2" />
                                <asp:TableCell><span class="priceFinal"><asp:Literal ID="lFinalRecap" runat="server" /></span></asp:TableCell>
                                <asp:TableCell />
                            </asp:TableRow>
                        </asp:Table>
					</div>
					<!-- /orderBox -->
								
				    <div class="cartButtons order-buttons">
                        <div class="cartButtons-desc">
                            <asp:CheckBox runat="server" ID="market_souhlas" ClientIDMode="Static" Text="Souhlasím se zpracováním údajů pro marketingové účely." Checked='<%# ZASutility.MyUtilitySpecial.GetDataFromSessionInXml("user_info","info_email")=="1" %>' />
                            <asp:Literal ID="lNoOrderBottom" runat="server" />
                        </div>
                        <asp:Button ID="btnBackBottom" runat="server"
                            Text="<%$ Resources: Resource, StepBack %>" CssClass="button gray btn btn-default" 
                            OnClick="btnBack_Click" />
                        <asp:Button ID="btnContinueToSaveBottom" runat="server"
                            Text="<%$ Resources: Resource, BtnFinishAndSendOrder %>" CssClass="button w b btn btn-basic" 
                            OnClick="btnSaveOrder_Click" />
				    </div>
					

				</div>
				<!-- /order -->
						
</asp:Panel>