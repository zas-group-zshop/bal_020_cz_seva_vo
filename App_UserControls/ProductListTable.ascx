<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductListTable.ascx.cs" Inherits="ZASshop.NET.ProductListTable" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">    
    <div class="table-responsive table-responsive-sm">
        <table class="productList product-list-table table table-bordered table-striped table-condensed">

            <thead>
                <tr>
                    <th><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, NameOfProduct %>" /></th>
                    <th>Nomenklatura</th>
                    <th>Skup. balení</th>
                    <th><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, Dostupnost %>" /></th>
                    <th>Cena bez DPH</th>
                    <th class="products text-right">
                        <asp:Button ID="btIntoBasketAll" runat="server" onclick="btIntoBasketAll_Click" CssClass="btn btn-basic btn-sm" ToolTip="<%$ Resources: Resource, BasketAfterInsertAllTitle %>" Text="<%$ Resources: Resource, BasketAfterInsertTitle %>" />
                    </th>
                </tr>
            </thead>

            <tbody>
                <asp:Repeater ID="rProductListTable" runat="server" 
                    OnItemCommand="rProductList_ItemCommand" 
                    onitemdatabound="rProductList_ItemDataBound" >
                    <ItemTemplate>
                        <tr class="product">
                            <td class="productTitle">
                                <a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>"><%# DataBinder.Eval(Container.DataItem, "nazev") %></a>
                            </td>

                             <td class="productParam">
                               <%# DataBinder.Eval(Container.DataItem, "cislo_nomenklatury") %>
                             </td>
                             <td class="productParam">
                               <%# DataBinder.Eval(Container.DataItem, "ean2_id_mj") %>
                             </td>

                            <td class="productParam ds dostupnost<%# DataBinder.Eval(Container.DataItem, "web_items_stav_skladu") %>">
                                <%# DataBinder.Eval(Container.DataItem, "web_items_stav_skladu") %>
                            </td>

                            <td class="productPrice" align="right">
                                <span class="price"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.PriceAndCurrency, DataBinder.Eval(Container.DataItem, "cena").ToString(), DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %></span>
                            </td>

                            <td class="productTools">
                                <div class="xtools">
                                    <asp:Panel ID="pAddToBasket" runat="server" CssClass="addToBasket">
                                        <asp:TextBox ID="tbQuantity" runat="server" Text="1" MaxLength="5" AutoPostBack="true" OnTextChanged="tbQuantity_TextChanged" CssClass="form-control input-sm product-list-table-quantity" style="height:35px;" />
                                        <zas:IntoBasketButton ID="btIntoBasket" runat="server" CssClass="button btn btn-sm btn-basic" CommandName="IntoBasket" Text="<%$ Resources: Resource, BasketEnter %>" ToolTip="<%$ Resources: Resource, BasketAfterInsertTitle %>"
                                            TbQuantityId="tbQuantity"
                                            Atribut1Id="ddlAtribut1" Atribut2Id="ddlAtribut2" Atribut3Id="ddlAtribut3" AtributKombId="ddlAtributKomb"
                                            Atribut1IdName='<%# DataBinder.Eval(Container.DataItem, "atribut_1_nazev") %>' Atribut2IdName='<%# DataBinder.Eval(Container.DataItem, "atribut_2_nazev") %>' Atribut3IdName='<%# DataBinder.Eval(Container.DataItem, "atribut_3_nazev") %>'
                                            Atribut1Prac='<%# DataBinder.Eval(Container.DataItem, "atribut_1_pracovat") %>' Atribut2Prac='<%# DataBinder.Eval(Container.DataItem, "atribut_2_pracovat") %>' Atribut3Prac='<%# DataBinder.Eval(Container.DataItem, "atribut_3_pracovat") %>'
                                            Atribut1Cis='<%# DataBinder.Eval(Container.DataItem, "atribut_1_cis") %>' Atribut2Cis='<%# DataBinder.Eval(Container.DataItem, "atribut_2_cis") %>' Atribut3Cis='<%# DataBinder.Eval(Container.DataItem, "atribut_3_cis") %>'
                                            Atribut1Req='<%# DataBinder.Eval(Container.DataItem, "atribut_1_povinnost") %>' Atribut2Req='<%# DataBinder.Eval(Container.DataItem, "atribut_2_povinnost") %>' Atribut3Req='<%# DataBinder.Eval(Container.DataItem, "atribut_3_povinnost") %>'
                                            AtributRozliseni='<%# DataBinder.Eval(Container.DataItem, "rozliseni") %>'
                                            IdNomen='<%# DataBinder.Eval(Container.DataItem, "id_nomen") %>'
                                            CisloNomen='<%# DataBinder.Eval(Container.DataItem, "cislo_nomenklatury") %>'
                                            TypAtributu='<%# DataBinder.Eval(Container.DataItem, "typ_atributu") %>'
                                            Nazev='<%# DataBinder.Eval(Container.DataItem, "nazev") %>'
                                            IdMj='<%# DataBinder.Eval(Container.DataItem, "id_mj") %>'
                                            Mj='<%# DataBinder.Eval(Container.DataItem, "mj") %>'
                                            Cena='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena")) %>'
                                            Dph='<%# DataBinder.Eval(Container.DataItem, "dph_anone").ToString()=="1" ? true : false %>'
                                            CenaMistni='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_mistni")) %>'
                                            IdMeny='<%# DataBinder.Eval(Container.DataItem, "id_meny") %>'
                                            SazbaDph='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "sazba_dph")) %>'
                                            KoeficientDph='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "koeficient")) %>'
                                            ZasobaCelkem='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "zasoba_celkem")) %>' />
                                    <zas:ZasCheckBox ID="hlSelected" runat="server" Tooltip="Výběr pro hromadné vložení do košíku" />
                                    </asp:Panel>

                                    <asp:HyperLink   Visible="false" ID="hlDetail"                  runat="server" CssClass="detail"      ToolTip="<%$ Resources: Resource, Detail %>"                 Text="<%$ Resources: Resource, Detail %>" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>' />
                                    <asp:Button      Visible="false" ID="hlCompare"                 runat="server" CssClass="compare"     ToolTip="<%$ Resources: Resource, CompareToolTip %>"         Text="<%$ Resources: Resource, Compare %>" CommandName="IntoCompare" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "cislo_nomenklatury") %>'/>
                                    
                                </div>
                            </td>
                            <td style="display: none"><asp:Button ID="btnRemoveFromShoppingList" runat="server" CssClass="btn btn-sm btn-danger remove-item" ToolTip="<%$ Resources: Resource, ShoppingListDeleteItem %>" Text="X" Visible="false" CommandName="RemoveFromShoppingList" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id_nomen") %>' /></td>
                        </tr><!-- .product -->
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>

        </table><!-- .productList -->
    </div>
</asp:Panel>