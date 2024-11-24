<%@ Page Language="C#" MasterPageFile="~/PanelMemberMaster.master" AutoEventWireup="true" CodeFile="PanelMemberEvaluation.aspx.cs" Inherits="PanelMemberEvaluation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
        <asp:Label ID="Label3" runat="server" Text="Project"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:DropDownList ID="DropDownList1" runat="server" Width="166px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
   <asp:ListItem Text="Select Project" Value="" Selected="True"></asp:ListItem>
</asp:DropDownList>
    
    <p style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <div style="text-align: center; font-size: 21px;">
    <strong>FYP 1 Evaluation Form</strong>
</div>
</p>
    
    <asp:Panel ID="pnlErrorMessage" runat="server" CssClass="error-box" Visible="false">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</asp:Panel>
<p style="margin-left: 200px">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="ErrorMessageLabel" runat="server" Text="" ForeColor="Red"></asp:Label>
</p>

    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        &nbsp;<p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">1. FYP Poster</strong></>
        <asp:Table ID="Table1" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
         <asp:TableHeaderCell></asp:TableHeaderCell>
    </asp:TableHeaderRow>
    <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Rating1" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Rating1" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton3" runat="server" GroupName="Rating1" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton4" runat="server" GroupName="Rating1" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton5" runat="server" GroupName="Rating1" Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton6" runat="server" GroupName="Rating1" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton7" runat="server" GroupName="Rating1" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton8" runat="server" GroupName="Rating1" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton9" runat="server" GroupName="Rating1" Value="1"/>
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton10" runat="server" GroupName="Rating1" Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton11" runat="server" GroupName="Rating1" Value="1"/>
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>
&nbsp;<p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">2. Iteration Definition, FYP Plan, Work Breakdown</strong></>
        <asp:Table ID="Table2" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
         <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
       <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton12" runat="server" GroupName="Rating2" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton13" runat="server" GroupName="Rating2" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton14" runat="server" GroupName="Rating2" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton15" runat="server" GroupName="Rating2" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton16" runat="server" GroupName="Rating2" Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton17" runat="server" GroupName="Rating2" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton18" runat="server" GroupName="Rating2" Value="1"/>
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton19" runat="server" GroupName="Rating2" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton20" runat="server" GroupName="Rating2" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton21" runat="server" GroupName="Rating2" Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton22" runat="server" GroupName="Rating2" Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>
&nbsp;</p>

    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">3. Work completed for the iteration(s) including design &amp; implementation</strong></>
        <asp:Table ID="Table3" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
             <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
       <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton23" runat="server" GroupName="Rating3" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton24" runat="server" GroupName="Rating3" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton25" runat="server" GroupName="Rating3" Value="1"/>
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton26" runat="server" GroupName="Rating3" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton27" runat="server" GroupName="Rating3" Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton28" runat="server" GroupName="Rating3" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton29" runat="server" GroupName="Rating3" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton30" runat="server" GroupName="Rating3" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton31" runat="server" GroupName="Rating3" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton32" runat="server" GroupName="Rating3" Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton33" runat="server" GroupName="Rating3" Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>

        <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">4. Slide Design and Content Quality</strong></>
        <asp:Table ID="Table4" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
             <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
        <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton34" runat="server" GroupName="Rating4" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton35" runat="server" GroupName="Rating4" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton36" runat="server" GroupName="Rating4" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton37" runat="server" GroupName="Rating4" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton38" runat="server" GroupName="Rating4" Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton39" runat="server" GroupName="Rating4" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton40" runat="server" GroupName="Rating4" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton41" runat="server" GroupName="Rating4" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton42" runat="server" GroupName="Rating4" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton43" runat="server" GroupName="Rating4" Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton44" runat="server" GroupName="Rating4" Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>


            <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">5. Style (Delivery, Confidence, Clarity)</strong></>
        <asp:Table ID="Table5" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
                 <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
           <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton45" runat="server" GroupName="Rating5" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton46" runat="server" GroupName="Rating5"  Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton47" runat="server" GroupName="Rating5"  Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton48" runat="server" GroupName="Rating5"  Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton49" runat="server" GroupName="Rating5"  Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton50" runat="server" GroupName="Rating5"  Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton51" runat="server" GroupName="Rating5"  Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton52" runat="server" GroupName="Rating5"  Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton53" runat="server" GroupName="Rating5"  Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton54" runat="server" GroupName="Rating5"  Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton55" runat="server" GroupName="Rating5"  Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>


                <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">6. Clarity of Project Scope</strong></>
        <asp:Table ID="Table6" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
             <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
        <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton56" runat="server" GroupName="Rating6" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton57" runat="server" GroupName="Rating6"  Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton58" runat="server" GroupName="Rating6"  Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton59" runat="server" GroupName="Rating6"  Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton60" runat="server" GroupName="Rating6"  Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton61" runat="server" GroupName="Rating6"  Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton62" runat="server" GroupName="Rating6"  Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton63" runat="server" GroupName="Rating6"  Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton64" runat="server" GroupName="Rating6"  Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton65" runat="server" GroupName="Rating6"  Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton66" runat="server" GroupName="Rating6"  Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>

                    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">7. Definition of Project Features</strong></>
        <asp:Table ID="Table7" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
             <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
        <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton67" runat="server" GroupName="Rating7" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton68" runat="server" GroupName="Rating7"  Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton69" runat="server" GroupName="Rating7"  Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton70" runat="server" GroupName="Rating7"  Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton71" runat="server" GroupName="Rating7"  Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton72" runat="server" GroupName="Rating7"  Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton73" runat="server" GroupName="Rating7"  Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton74" runat="server" GroupName="Rating7"  Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton75" runat="server" GroupName="Rating7"  Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton76" runat="server" GroupName="Rating7"  Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton77" runat="server" GroupName="Rating7" Value="1"  />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>

   
                    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">8. Team Dynamics (Coordination among team members)</strong></>
        <asp:Table ID="Table8" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
         <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
        <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton78" runat="server" GroupName="Rating8" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton79" runat="server" GroupName="Rating8" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton80" runat="server" GroupName="Rating8" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton81" runat="server" GroupName="Rating8" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton82" runat="server" GroupName="Rating8" Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton83" runat="server" GroupName="Rating8" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton84" runat="server" GroupName="Rating8" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton85" runat="server" GroupName="Rating8" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton86" runat="server" GroupName="Rating8" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton87" runat="server" GroupName="Rating8" Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton88" runat="server" GroupName="Rating8" Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>
                        
                    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">9. Timing of Presentation</strong></>
        <asp:Table ID="Table9" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
         <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
        <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton89" runat="server" GroupName="Rating9" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton90" runat="server" GroupName="Rating9" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton91" runat="server" GroupName="Rating9" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton92" runat="server" GroupName="Rating9" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton93" runat="server" GroupName="Rating9" Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton94" runat="server" GroupName="Rating9" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton95" runat="server" GroupName="Rating9" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton96" runat="server" GroupName="Rating9" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton97" runat="server" GroupName="Rating9" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton98" runat="server" GroupName="Rating9" Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton99" runat="server" GroupName="Rating9" Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>
                        
                    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">10. Implementation Work Completion</strong></>
        <asp:Table ID="Table10" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
             <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
       <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton100" runat="server" GroupName="Rating10" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton101" runat="server" GroupName="Rating10" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton102" runat="server" GroupName="Rating10" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton103" runat="server" GroupName="Rating10" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton104" runat="server" GroupName="Rating10" Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton105" runat="server" GroupName="Rating10" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton106" runat="server" GroupName="Rating10" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton107" runat="server" GroupName="Rating10" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton108" runat="server" GroupName="Rating10" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton109" runat="server" GroupName="Rating10" Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton110" runat="server" GroupName="Rating10" Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>
                        
                    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">11. Overall work quality and impression</strong></>
        <asp:Table ID="Table11" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
             <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
        <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton111" runat="server" GroupName="Rating11" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton112" runat="server" GroupName="Rating11" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton113" runat="server" GroupName="Rating11" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton114" runat="server" GroupName="Rating11" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton115" runat="server" GroupName="Rating11" Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton116" runat="server" GroupName="Rating11" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton117" runat="server" GroupName="Rating11" Value="1"/>
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton118" runat="server" GroupName="Rating11" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton119" runat="server" GroupName="Rating11" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton120" runat="server" GroupName="Rating11" Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton121" runat="server" GroupName="Rating11" Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>
                        
                    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">12. Code Quality</strong></>
        <asp:Table ID="Table12" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
             <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
       <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton122" runat="server" GroupName="Rating12" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton123" runat="server" GroupName="Rating12" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton124" runat="server" GroupName="Rating12" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton125" runat="server" GroupName="Rating12" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton126" runat="server" GroupName="Rating12" Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton127" runat="server" GroupName="Rating12" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton128" runat="server" GroupName="Rating12" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton129" runat="server" GroupName="Rating12" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton130" runat="server" GroupName="Rating12" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton131" runat="server" GroupName="Rating12" Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton132" runat="server" GroupName="Rating12" Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>
                        
                    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">13. Level of code integration</strong></>
        <asp:Table ID="Table13" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
         <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
        <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton133" runat="server" GroupName="Rating13" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton134" runat="server" GroupName="Rating13" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton135" runat="server" GroupName="Rating13" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton136" runat="server" GroupName="Rating13" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton137" runat="server" GroupName="Rating13" Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton138" runat="server" GroupName="Rating13" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton139" runat="server" GroupName="Rating13" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton140" runat="server" GroupName="Rating13" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton141" runat="server" GroupName="Rating13" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton142" runat="server" GroupName="Rating13" Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton143" runat="server" GroupName="Rating13" Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>
                        
                    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">14. Class Diagram/DFD (provided in the report) correctly maps to the Code
Implemented</strong></>
        <asp:Table ID="Table14" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>

         <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
        <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton144" runat="server" GroupName="Rating14" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton145" runat="server" GroupName="Rating14" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton146" runat="server" GroupName="Rating14" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton147" runat="server" GroupName="Rating14"  Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton148" runat="server" GroupName="Rating14" Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton149" runat="server" GroupName="Rating14" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton150" runat="server" GroupName="Rating14" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton151" runat="server" GroupName="Rating14" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton152" runat="server" GroupName="Rating14" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton153" runat="server" GroupName="Rating14" Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton154" runat="server" GroupName="Rating14" Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>
                        
                    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">15. Handling of Questions</strong></>
        <asp:Table ID="Table15" runat="server"   Width="60%" Height="100px" style="margin: 0 auto;">
            <asp:TableHeaderRow>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell>0</asp:TableHeaderCell>
        <asp:TableHeaderCell>1</asp:TableHeaderCell>
        <asp:TableHeaderCell>2</asp:TableHeaderCell>
        <asp:TableHeaderCell>3</asp:TableHeaderCell>
        <asp:TableHeaderCell>4</asp:TableHeaderCell>
        <asp:TableHeaderCell>5</asp:TableHeaderCell>
        <asp:TableHeaderCell>6</asp:TableHeaderCell>
        <asp:TableHeaderCell>7</asp:TableHeaderCell>
        <asp:TableHeaderCell>8</asp:TableHeaderCell>
        <asp:TableHeaderCell>9</asp:TableHeaderCell>
        <asp:TableHeaderCell>10</asp:TableHeaderCell>
         <asp:TableHeaderCell></asp:TableHeaderCell>
        
    </asp:TableHeaderRow>
       <asp:TableRow>
        <asp:TableCell>min</asp:TableCell>
        <asp:TableCell>
          <asp:RadioButton ID="RadioButton155" runat="server" GroupName="Rating15" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton156" runat="server" GroupName="Rating15" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton157" runat="server" GroupName="Rating15" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton158" runat="server" GroupName="Rating15" Value="1" />
      </asp:TableCell>
      <asp:TableCell>
          <asp:RadioButton ID="RadioButton159" runat="server" GroupName="Rating15" Value="1" />
      </asp:TableCell>
       <asp:TableCell>
      <asp:RadioButton ID="RadioButton160" runat="server" GroupName="Rating15" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton161" runat="server" GroupName="Rating15" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton162" runat="server" GroupName="Rating15" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton163" runat="server" GroupName="Rating15" Value="1" />
  </asp:TableCell>
  <asp:TableCell>
      <asp:RadioButton ID="RadioButton164" runat="server" GroupName="Rating15" Value="1" />
  </asp:TableCell>
        <asp:TableCell>
    <asp:RadioButton ID="RadioButton165" runat="server" GroupName="Rating15" Value="1" />
</asp:TableCell>
        <asp:TableCell>max</asp:TableCell>
    </asp:TableRow>
        </asp:Table>
    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        &nbsp;<p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <strong style="box-sizing: border-box;">Comments</strong></>
        
    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <asp:TextBox ID="TextBox3" runat="server" Height="100px" Width="460px" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
    <p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        &nbsp;<p
       style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

