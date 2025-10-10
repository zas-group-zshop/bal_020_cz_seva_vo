<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Registration.ascx.cs" Inherits="ZASshop.NET.Registration" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
    <script type="text/javascript">
        function SetIc(source, eventArgs) {
            <%= registrace_firma_ic.ClientID%>.value = "";
            <%= registrace_firma_dic.ClientID%>.value = "";
            var items;
            if(eventArgs.get_value()!=null)
            {
                items = eventArgs.get_value().split("|");
                if(items[0]!=null)
                {
                    $find('<%= aceIc.ClientID%>').set_contextKey(items[0]);
                    <%= registrace_firma_ic.ClientID%>.value = items[0];
                }
                if(items[1]!=null)
                {
                    <%= registrace_firma_dic.ClientID%>.value = items[1];
                }
            }
        }
        function SetCompany(source, eventArgs) {
            <%= registrace_firma_dic.ClientID%>.value = "";
            <%= registrace_firma.ClientID%>.value = "";
            var items;
            if(eventArgs.get_value()!=null)
            {
                items = eventArgs.get_value().split("|");
                if(items[0]!=null)
                {
                    <%= registrace_firma_dic.ClientID%>.value = items[0];
                }
                if(items[1]!=null)
                {
                    $find('<%= aceCompany.ClientID%>').set_contextKey(items[0]);
                    <%= registrace_firma.ClientID%>.value = items[1];
                }
            }
        }

        function validateIC(evt) {
          if($("[data-attr-stat]").val() === "CZ" || $("[data-attr-stat]").val() === "SK") {
              var theEvent = evt || window.event;
              var key = theEvent.keyCode || theEvent.which;
              key = String.fromCharCode( key );
              var regex = /[0-9]|\./;
              if( !regex.test(key) ) {
                theEvent.returnValue = false;
                if(theEvent.preventDefault) theEvent.preventDefault();
              }
          }
        }

        function validateDIC(evt) {
            var valdic = $("[data-attr-dic]").val();

            if(valdic.length >= 2) {

                if($("[data-attr-stat]").val() === "CZ") {
                                      var theEvent = evt || window.event;
                                      var key = theEvent.keyCode || theEvent.which;
                                      key = String.fromCharCode( key );
                                      var regex = /[0-9]|\./;
                                      if( !regex.test(key) ) {
                                        theEvent.returnValue = false;
                                        if(theEvent.preventDefault) theEvent.preventDefault();
                                      }
                                  }

            }
        }

        function validateFormatDIC(val) {

                           var dic = $(val).val();

                           if($("[data-attr-stat]").val() === "CZ" && dic != "") {

                           var num = dic.substr(2);

                            if(dic.toLowerCase().indexOf("cz") >= 0) {

                                 if (num.match(/^\d+$/)) {

                                    $("[data-attr-dic-help]").html("");
                                    $("[data-attr-dic-help]").parent(".formRow").removeClass("form-error");

                                 } else {

                                     $("[data-attr-dic-help]").html('<%= ZASutility.MyUtility.GetLangResource("DICvalidationFormat") %>');
                                     $("[data-attr-dic-help]").parent(".formRow").addClass("form-error");

                                 }

                            } else {
                                $("[data-attr-dic-help]").html('<%= ZASutility.MyUtility.GetLangResource("DICvalidationFormat") %>');
                                $("[data-attr-dic-help]").parent(".formRow").addClass("form-error");
                            }

                           } else {

                                $("[data-attr-dic-help]").html("");
                                $("[data-attr-dic-help]").parent(".formRow").removeClass("form-error");
                            }

                        }

        function SearchCompanyAres( set ) {

            var ic = $(set).val();

            if($("[data-attr-stat]").val() === "CZ" && ic != "" ) {

                     $("[data-attr-ic-help]").show();
                     $("[data-attr-ic-help]").html('<%= ZASutility.MyUtility.GetLangResource("ARESsearching") %> <span class="loader"></span>');

                     $.ares(ic, {
                        notfound: function() {

                            $("[data-attr-ic-help]").html('<%= ZASutility.MyUtility.GetLangResource("ICwasNotFounded") %>');
                                                  },
                         finished: function(object) {
                          $("[data-attr-dic]").val(object.vatNumber);
                          $("[data-attr-name]").val(object.name);
                          $("[data-attr-ic-help]").html("IČ je v pořádku");
                          $("[data-attr-ic-help] .loader").hide();
                          $("[data-attr-dic]").trigger("change");

                          }
                        });
            }
        }

        function CheckAres() {
                                  if($("[data-attr-stat]").val() === "CZ") {
                                          $("[data-attr-ic-help]").show();
                                          $("[data-attr-dic-help]").show();
                                          $("[data-attr-ic]").trigger("change");
                                          $("[data-attr-dic]").trigger("change");
                                  } else {
                                          $("[data-attr-ic-help]").hide();
                                          $("[data-attr-dic-help]").hide();
                                          $("[data-attr-dic-help]").parent(".formRow").removeClass("form-error");
                                  }

        }

        $(document).ready(CheckAres);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(CheckAres);

    </script>

<asp:Panel ID="pRegistrationData" runat="server" CssClass="form-inline">
        <div class="personalCompany order-box customer-type-change">
            <asp:RadioButton ID="personalAccount" runat="server" GroupName="TypeOfAccount" Text="<%$ Resources: Resource, PersonalAccount %>" Checked="true" AutoPostBack="true" OnCheckedChanged="personalAccount_CheckedChanged" />
            <asp:RadioButton ID="companyAccount" runat="server" GroupName="TypeOfAccount" Text="<%$ Resources: Resource, CompanyAccount %>" AutoPostBack="true" OnCheckedChanged="companyAccount_CheckedChanged"/>
        </div>
        
        <div class="formRow">
            <label class="formLabel">
                <asp:Label ID="lFirstName" runat="server" Text="<%$ Resources: Resource, FirstName %>" Font-Bold="true"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="*" Font-Bold="true" />
            </label>
            <zas:ZasTextBox ID="registrace_jmeno" runat="server" DetailMode="Insert" AutoCompleteType="FirstName" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfv_registrace_jmeno" runat="server"
                ControlToValidate="registrace_jmeno"
                ErrorMessage="<%$ Resources: Resource, FirstNameIsRequired %>" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
        </div>
        
        <div class="formRow">
            <label class="formLabel">
                <asp:Label ID="lSurName" runat="server" Text="<%$ Resources: Resource, SurName %>" Font-Bold="true"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="*" Font-Bold="true" />
            </label>
            <zas:ZasTextBox ID="registrace_prijmeni" runat="server" DetailMode="Insert" AutoCompleteType="LastName" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfv_registrace_prijmeni" runat="server"
                ControlToValidate="registrace_prijmeni"
                ErrorMessage="<%$ Resources: Resource, LastNameIsRequired %>" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
        </div>

        <div class="formRow state">
            <label class="formLabel">
                <asp:Label ID="lState" runat="server" Text="<%$ Resources: Resource, State %>" Font-Bold="true"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="*" Font-Bold="true" />
            </label>
            <asp:DropDownList ID="registrace_stat" ClientIDMode="Static" data-attr-stat runat="server" AutoPostBack="true" OnSelectedIndexChanged="registrace_stat_SelectedIndexChanged" CssClass="form-control" />
        </div>

        <div id="StateState" runat="server" class="formRow state-state">
            <label class="formLabel">
                <asp:Label ID="Label5" runat="server" Text="<%$ Resources: Resource, StateState %>" Font-Bold="true"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="*" Font-Bold="true" />
            </label>
            <zas:ZasDropDownList ID="uz_jednotka" runat="server"
                EnableViewState="false" ViewStateMode="Disabled" DetailMode="Edit"
                InitialValue="" Enabled="true"
                data-select-value='kod'
                data-select-result-row-text='kod,nazev'
                data-select-result-row-value='nazev'
                data-count='20'
                data-free='false'
                data-height='300' data-clear="true"
                data-command='GET_UZ_JEDNOTKY_FT'
                data-parameters='{"par":"strcis"}'
                data-dynamic-parameters='{"stat":"registrace_stat"}'
                data-query-min-length='0'
                data-result-names='items,item'
                CssClass="form-control-in-panel form-control select-combobox" />
            <!-- Na plnenych udajich musi byt EnableViewState="false" ViewStateMode="Disabled", jinak to nefunguje dobre. -->
        </div>
        
        <asp:Panel ID="pCompanyInfo" runat="server" CssClass="formRow">

            <div class="formRow">

                                    <label class="formLabel">
                                        <asp:Label ID="lCompanyNameIC" runat="server" Text="<%$ Resources: Resource, CompanyIC %>" Font-Bold="true"></asp:Label>
                                    </label>
                                    <ajaxToolkit:AutoCompleteExtender ID="aceIc" runat="server" Enabled="false"
                                        CompletionListCssClass="suggest" CompletionListHighlightedItemCssClass="suggestActive" CompletionListItemCssClass="suggestItem"
                                        TargetControlID="registrace_firma_ic"
                                        ServicePath = "~/AutoComplete.asmx" ServiceMethod="GetAresList" CompletionInterval="500" CompletionSetCount="20" EnableCaching="true" DelimiterCharacters="%,;:^#" UseContextKey="true"
                                        OnClientItemSelected="SetCompany"
                                        MinimumPrefixLength="6" >
                                        <Animations>
                                            <OnShow>
                                                <Sequence>
                                                    <OpacityAction Opacity="0" />
                                                    <HideAction Visible="true" />
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </ajaxToolkit:AutoCompleteExtender>
                                    <zas:ZasTextBox ID="registrace_firma_ic" onchange="SearchCompanyAres(this);" data-attr-ic onkeypress="validateIC(event);" runat="server" DetailMode="Insert" CssClass="form-control" />

                                    <small data-attr-ic-help class="text-muted" style="display: none">
                                        <%= ZASutility.MyUtility.GetLangResource("ARESinfo") %>
                                    </small>
                                </div>

            <asp:TextBox ID="registrace_firma_anone" TextMode="SingleLine" style="display:none;" runat="server"></asp:TextBox>
            <div class="formRow">
                <label class="formLabel">
                    <asp:Label ID="lCompanyName" runat="server" Text="<%$ Resources: Resource, CompanyName %>" Font-Bold="true"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="*" Font-Bold="true" />
                </label>
                <ajaxToolkit:AutoCompleteExtender ID="aceCompany" runat="server" Enabled="false"
                    CompletionListCssClass="suggest" CompletionListHighlightedItemCssClass="suggestActive" CompletionListItemCssClass="suggestItem"
                    TargetControlID="registrace_firma"
                    ServicePath = "~/AutoComplete.asmx" ServiceMethod="GetAresList" CompletionInterval="500" CompletionSetCount="20" EnableCaching="true" DelimiterCharacters="%,;:^#" UseContextKey="true"
                    OnClientItemSelected="SetIc"
                    MinimumPrefixLength="5" >
                    <Animations>
                        <OnShow>
                            <Sequence>
                                <OpacityAction Opacity="0" />
                                <HideAction Visible="true" />
                                <Parallel Duration=".4">
                                    <FadeIn />
                                </Parallel>
                            </Sequence>
                        </OnShow>
                        <OnHide>
                            <Parallel Duration=".4">
                                <FadeOut />
                            </Parallel>
                        </OnHide>
                    </Animations>
                </ajaxToolkit:AutoCompleteExtender>
                <zas:ZasTextBox ID="registrace_firma" data-attr-name runat="server" DetailMode="Insert" AutoCompleteType="Company" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfv_registrace_firma" runat="server"
                    ControlToValidate="registrace_firma" Enabled="false"
                    ErrorMessage="<%$ Resources: Resource, AddressCompanyNameIsRequired %>" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
            </div>
        

        
            <div class="formRow">
                <label><asp:Label ID="lCompanyNameDIC" runat="server" Text="<%$ Resources: Resource, CompanyDIC %>" CssClass="formLabel"></asp:Label></label>
                <zas:ZasTextBox ID="registrace_firma_dic" onkeypress="validateDIC(event);" onchange="validateFormatDIC(this);" data-attr-dic runat="server" DetailMode="Insert" CssClass="form-control" />
                <span data-attr-dic-help class="form-error-span" style="display: inline-block;"></span>
            </div>

            <asp:Panel ID="IcDPH" CssClass="formRow" runat="server">
                <asp:Label ID="lCompanyNameIcDph" runat="server" Text="<%$ Resources: Resource, CompanyIcDPH %>" CssClass="formLabel"></asp:Label>
                <zas:ZasTextBox ID="registrace_firma_ic_dph" runat="server" DetailMode="Insert" CssClass="form-control" />
            </asp:Panel>
        </asp:Panel>
        <asp:CollapsiblePanelExtender ID="cpeCompanyInfo" runat="Server" Enabled="false"
            TargetControlID="pCompanyInfo"
            ExpandControlID="companyAccount" 
            CollapseControlID="personalAccount" 
            Collapsed="True"
            SuppressPostBack="false" />
        

        <div class="formRow">
            <label class="formLabel">
                <asp:Label ID="lMobil" runat="server" Text="<%$ Resources: Resource, Mobil %>"></asp:Label>
                <asp:Label ID="lMobilReq" runat="server" Text="*" Font-Bold="true" Visible="false"/>
            </label>
            <asp:TextBox ID="registrace_mobil_preset" runat="server" Width="60" MaxLength="4" CssClass="form-control" />
            <zas:ZasTextBox ID="registrace_mobil" runat="server" DetailMode="Insert" Type="PhoneNumber" AutoCompleteType="Cellular" CssClass="form-control form-control-phone" />
            <asp:FilteredTextBoxExtender ID="f_registrace_mobil" runat="server"
                TargetControlID="registrace_mobil"
                FilterType="Numbers,Custom"
                ValidChars=" " />
            <asp:RequiredFieldValidator ID="rfv_registrace_mobil" runat="server" Enabled="false"
                ControlToValidate="registrace_mobil"
                ErrorMessage="<%$ Resources: Resource, MobilIsRequired %>" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="rev_registrace_mobil" runat="server"
                ControlToValidate="registrace_mobil"
                ValidationExpression="^([0-9][ ]{0,1}){9,9}$"
                ErrorMessage="<%$ Resources: Resource, MobilWrongFormat %>" Display="Dynamic" SetFocusOnError="true" ValidationGroup="Registration" />
        </div>
        
        <div class="formRow">
            <label class="formLabel">
                <asp:Label ID="lPhone" runat="server" Text="<%$ Resources: Resource, Phone %>"></asp:Label>
                <asp:Label ID="lPhoneReq" runat="server" Text="*" Font-Bold="true" Visible="false" />
            </label>
            <asp:TextBox ID="registrace_telefon_preset" runat="server" Width="60" MaxLength="4" CssClass="form-control" />
            <zas:ZasTextBox ID="registrace_telefon" runat="server" DetailMode="Insert" Type="PhoneNumber" CssClass="form-control form-control-phone" />
            <asp:FilteredTextBoxExtender ID="f_registrace_telefon" runat="server"
                TargetControlID="registrace_telefon"
                FilterType="Numbers,Custom"
                ValidChars=" " />
            <asp:RequiredFieldValidator ID="rfv_registrace_telefon" runat="server" Enabled="false"
                ControlToValidate="registrace_telefon"
                ErrorMessage="<%$ Resources: Resource, PhoneIsRequired %>" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="rev_registrace_telefon" runat="server"
                ControlToValidate="registrace_telefon"
                ValidationExpression="^([0-9][ ]{0,1}){9,9}$"
                ErrorMessage="<%$ Resources: Resource, PhoneWrongFormat %>" Display="Dynamic" SetFocusOnError="true" ValidationGroup="Registration" />
        </div>

        <div class="formRow">
            <label class="formLabel">
                <asp:Label ID="lUserKodSleva" runat="server" Text="Kód pro slevu"></asp:Label>
            </label>
            <zas:ZasTextBox ID="user_kod_sleva" runat="server" DetailMode="Insert" MaxLenght="6" CssClass="form-control"/>
        </div>

</asp:Panel>

</asp:Panel>