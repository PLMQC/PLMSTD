page 33000897 "Sub-Con Work Sheet B2B"
{

    AutoSplitKey = true;
    Caption = 'Sub-Con Work Sheet';
    DelayedInsert = true;
    PageType = Worksheet;
    SourceTable = "SubCon WorkSheet B2B";
    SourceTableView = WHERE(Posted = FILTER(false));
    UsageCategory = Tasks;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            field(MachName; MachNameVar)
            {
                Caption = 'Machine Name';
                ApplicationArea = all;
                Tooltip = 'It specifies the Machine name.';
                trigger OnLookup(Var Text: Text): Boolean;
                begin


                    if PAGE.RUNMODAL(0, MachineVar4) = ACTION::LookupOK then begin
                        MachNameVar := MachineVar4."No.";
                        if MachNameVar <> '' then
                            Rec.SETRANGE("Machine Id", MachNameVar)
                        else
                            Rec.SETRANGE("Machine Id");
                        CurrPage.UPDATE();

                    end;
                end;

                trigger OnValidate();
                begin
                    MachNameVarOnAfterValidate();
                end;
            }
            repeater(Control1102154000)
            {
                field("Equipment ID"; Rec."Machine Id")
                {
                    ApplicationArea = all;
                    ToolTip = 'It specifies the Equipment ID.';
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'This Field Displays the Job card Number.';
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    Tooltip = 'It Displays the Job Card Description.';
                }
                field("Service Type"; Rec."Service Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Service Type.';
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = all;
                    Tooltip = 'It Displays the Date.';
                }
                field(External; Rec.External)
                {
                    ApplicationArea = all;
                    Tooltip = 'It Shows The External Maintenance type has beed Applied.';
                }
                field("Maintenacne Type"; Rec."Inspection Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Displays the Inspection type.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Subcontracting Vendor.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines UOM of the Products.';
                }
                field("Unit Rate"; Rec."Unit Rate")
                {
                    ApplicationArea = all;
                    Tooltip = 'It Specifies the Unit Rate of the Product.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                    Tooltip = 'It Specifies the Qunatity of the Product.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                    Tooltip = 'It shows the Amount Specified.';
                    Editable = false;
                }
                field("Carry Out"; Rec."Carry Out")
                {
                    ApplicationArea = all;
                    ToolTip = 'This boolean field used to post the Sub contracting order.';
                }
                field("Document Type"; Rec."Document Type")
                {

                    ApplicationArea = all;
                    Tooltip = 'It Shows the Document Type.';
                    trigger OnValidate();
                    begin
                        Rec.TESTFIELD("Document Type", Rec."Document Type"::Order);
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Get Sub-Con Lines")
                {
                    Caption = 'Get Sub-Con Lines';
                    ApplicationArea = all;
                    ToolTip = 'This function is used to get the created Subcontract orders lines.';
                    Image = GetLines;

                    trigger OnAction();
                    begin

                        if SubConWorkSheetRec.FINDLAST() then
                            LineNo2 := SubConWorkSheetRec."Line No."
                        else
                            LineNo2 := 10000;
                        PMJobHeaderRec.RESET();
                        PMJobHeaderRec.SETRANGE(Posted, false);
                        PMJobHeaderRec.SETRANGE(Status, PMJobHeaderRec.Status::Released);
                        PMJobHeaderRec.SETRANGE(External, true);

                        if MachNameVar <> '' then
                            PMJobHeaderRec.SETRANGE("Machine ID", MachNameVar);



                        if PMJobHeaderRec.FINDFIRST() then
                            repeat
                                SubConWorkSheetRec.INIT();
                                SubConWorkSheetRec."Job Card No." := PMJobHeaderRec."No.";
                                SubConWorkSheetRec."Line No." := LineNo2;
                                SubConWorkSheetRec."Unit of Measure" := PMJobHeaderRec.UOM;
                                SubConWorkSheetRec."Vendor No." := PMJobHeaderRec."Vendor No.";
                                SubConWorkSheetRec.VALIDATE("Inspection Type", PMJobHeaderRec."Maintenance Type");
                                SubConWorkSheetRec."Service Type" := PMJobHeaderRec.Type;

                                EndDate := DT2DATE(PMJobHeaderRec."Start Date Time");
                                SubConWorkSheetRec.Date := EndDate;
                                SubConWorkSheetRec."Machine Id" := PMJobHeaderRec."Machine ID";

                                PMJobLineRec.SETRANGE("Job Header No.", PMJobHeaderRec."No.");
                                if PMJobLineRec.FINDFIRST() then begin
                                    SubConWorkSheetRec."Unit Rate" := PMJobLineRec."Unit Rate";
                                    SubConWorkSheetRec.Quantity := PMJobLineRec.Quantity;
                                    SubConWorkSheetRec.Amount := PMJobLineRec.Amount;
                                    SubConWorkSheetRec.Spares := PMJobLineRec.Spares;
                                    SubConWorkSheetRec.Resource := PMJobLineRec.Resource;
                                    SubConWorkSheetRec.Description := PMJobLineRec.Description;
                                end;


                                SubConWorkSheetRec.INSERT(true);
                                LineNo2 += 10000;
                            until PMJobHeaderRec.NEXT() = 0
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action(Post)
                {
                    Caption = 'Post';
                    ApplicationArea = all;
                    Tooltip = 'This action is used to post the Sub contracting orders.';
                    Image = Post;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        Rec.CreatePurchaseDocument();
                    end;
                }
            }
        }
    }

    trigger OnClosePage();
    begin
        JobCard.RESET();
        JobCard.SETRANGE("No.", Rec."Job Card No.");
        if JobCard.FIND('-') then begin
            WorkSheet.SETRANGE("Job Card No.", JobCard."No.");
            if WorkSheet.FIND('-') then begin
                JobCard."Total Cost" := 0;
                repeat
                    JobCard."Total Cost" := JobCard."Total Cost" + WorkSheet.Amount;
                until WorkSheet.NEXT() = 0;
            end;
            JobCard.MODIFY();
        end;
    end;

    var
        JobCard: Record "PM Job Header B2B";
        WorkSheet: Record "Work Sheet B2B";
        PMJobHeaderRec: Record "PM Job Header B2B";
        PMJobLineRec: Record "PM Job Line B2B";
        SubConWorkSheetRec: Record "SubCon WorkSheet B2B";
        MachineVar4: Record "Equipment B2B";
        LineNo2: Integer;
        EndDate: Date;
        MachNameVar: Code[20];


    local procedure MachNameVarOnAfterValidate();
    begin
        if MachNameVar <> '' then
            Rec.SETRANGE("Machine Id", MachNameVar)
        else
            Rec.SETRANGE("Machine Id");
        CurrPage.UPDATE();
    end;
}

