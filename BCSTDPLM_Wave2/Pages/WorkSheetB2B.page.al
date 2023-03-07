page 33000916 "Work Sheet B2B"
{

    AutoSplitKey = true;
    Caption = 'Work Sheet';
    DelayedInsert = true;
    PageType = Worksheet;
    SourceTable = "Work Sheet B2B";
    UsageCategory = Tasks;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(WorkSheet)
            {
                Caption = 'WorkSheet';
                field("Line Type"; Rec."Line Type")
                {

                    ApplicationArea = all;
                    ToolTip = 'It Defines the Line Type.';
                    trigger OnValidate();
                    begin

                        LineType.RESET();
                        LineType.SETRANGE(Code, Rec."Line Type");
                        if LineType.FINDFIRST() then
                            if (LineType."Resource Person") or (LineType."Resource Equipment") then begin
                                "Time RequiredEditable" := true;
                                QuantityEditable := false;
                            end else begin
                                "Time RequiredEditable" := false;
                                QuantityEditable := true;
                            end;
                    end;
                }
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Job card Number.';
                    Visible = false;
                }
                field("I/R Code"; Rec."I/R Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the I/R code.';
                    Caption = 'No';

                    trigger OnValidate();
                    begin
                        Rec.CheckPersons();
                    end;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Department Code.';
                    Visible = true;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Project code.';
                    Visible = true;
                }
                field("I/R Description"; Rec."I/R Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the I/R Description.';
                    Caption = 'Description';
                }
                field("Time Required"; Rec."Time Required")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Time Required.';
                    Caption = 'Hours Consumed';
                    Editable = "Time RequiredEditable";
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Status.';
                    OptionCaption = 'Open,Released';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Quantity.';
                    Editable = QuantityEditable;
                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the UOM.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Unit Cost.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Amount.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Vendor Number.';
                    Editable = "Vendor No.Editable";
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Posting status.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Location code.';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Bin Against the Location.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Dimensions list.';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        Rec.ShowDimensions();
                    end;
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Item tracking specifications.';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction();
                    begin
                        Rec.OpenItemTrackingLines(false);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Release function.';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin

                        RelPLMDoc.ReleaseWorkSheet(Rec);
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Repoen Function.';
                    Image = ReOpen;

                    trigger OnAction();
                    begin

                        RelPLMDoc.ReopenWorkSheet(Rec);
                    end;
                }
            }
            group("P&ost")
            {
                Caption = 'P&ost';
                action(Action1102154026)
                {
                    Caption = 'P&ost';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Post Funtion.';
                    Image = Post;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        Rec.Post();
                        PMJobHeaderGRec.SETRANGE("Machine ID", Rec."Machine ID");
                        PMJobHeaderGRec.SETRANGE("No.", Rec."Job Card No.");
                        if PMJobHeaderGRec.FINDFIRST() then begin
                            PMJobHeaderGRec.CALCFIELDS("Actual Resource Cost");
                            PMJobHeaderGRec.CALCFIELDS("Actual Spares Cost");
                            PMJobHeaderGRec."Total Cost" := PMJobHeaderGRec."Actual Resource Cost" + PMJobHeaderGRec."Actual Spares Cost";
                            PMJobHeaderGRec.MODIFY();
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.EDITABLE(false)
        else
            CurrPage.EDITABLE(true);

        if (Rec."Line Type Values" = Rec."Line Type Values"::Resource) then begin
            "Time RequiredEditable" := true;
            QuantityEditable := false;
        end else begin
            "Time RequiredEditable" := false;
            QuantityEditable := true;
        end;

        VendorNoOnFormat();
    end;

    trigger OnInit();
    begin
        "Vendor No.Editable" := true;
        QuantityEditable := true;
        "Time RequiredEditable" := true;
    end;

    trigger OnModifyRecord(): Boolean;
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.EDITABLE(false)
        else
            CurrPage.EDITABLE(true);
    end;

    var
        LineType: Record "Line Type B2B";
        PLMSetup: Record "Plant Maintenance Setup B2B";
        GenJnl: Record "Gen. Journal Line";
        WorkSheetRec: Record "Work Sheet B2B";
        MachineRec: Record "Equipment B2B";
        FADepBook: Record "FA Depreciation Book";
        FAPostGrpRec: Record "FA Posting Group";
        PMJobHeaderGRec: Record "PM Job Header B2B";
        LineType2: Record "Line Type B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RelPLMDoc: Codeunit "Release PLM Document B2B";
        RLineNo: Integer;
        FAPostGrp: Code[20];
        Amt: Decimal;
        [InDataSet]
        "Time RequiredEditable": Boolean;
        [InDataSet]
        QuantityEditable: Boolean;
        [InDataSet]
        "Vendor No.Editable": Boolean;
        GJnlTextLbl: Label 'GJNL-FA';
        CompanyTextLbl: Label 'COMPANY';

    procedure PostFAGL();
    begin
        CLEAR(Amt);
        RLineNo := 10000;

        GenJnl.RESET();
        WorkSheetRec.RESET();

        GenJnl.SETRANGE("Journal Batch Name", PLMSetup."General Journal Line Batch");
        if GenJnl.FINDFIRST() then
            GenJnl.DELETEALL();
        WorkSheetRec.SETRANGE("Job Card No.", Rec."Job Card No.");
        WorkSheetRec.SETRANGE("Line No.", Rec."Line No.");
        if WorkSheetRec.FIND('-') then
            repeat
                GenJnl.INIT();
                GenJnl."Journal Template Name" := PLMSetup."Fixed Asset Template";
                GenJnl."Journal Batch Name" := PLMSetup."Fixed Asset Journal Batch";
                GenJnl."Posting Date" := WORKDATE();
                GenJnl."Document Date" := WORKDATE();
                GenJnl."Document No." := NoSeriesMgt.GetNextNo(GJnlTextLbl, WORKDATE(), true);
                GenJnl."Document Type" := GenJnl."Document Type"::"Credit Memo";
                GenJnl."Line No." := RLineNo;
                GenJnl."Machine Id B2B" := WorkSheetRec."Machine ID";
                GenJnl.VALIDATE("Account Type", 4);
                MachineRec.GET(Rec."Machine ID");
                GenJnl.VALIDATE("Account No.", MachineRec."Fixed Asset Code");
                GenJnl.VALIDATE("FA Posting Type", 8);
                GenJnl.VALIDATE(Quantity, WorkSheetRec.Quantity);
                GenJnl.VALIDATE(Amount, WorkSheetRec.Amount);
                Amt += WorkSheetRec.Amount;
                GenJnl.VALIDATE("Shortcut Dimension 1 Code", WorkSheetRec."Shortcut Dimension 1 Code");
                GenJnl.VALIDATE("Shortcut Dimension 2 Code", WorkSheetRec."Shortcut Dimension 2 Code");
                if MachineRec.FINDFIRST() then begin
                    FADepBook.SETRANGE("FA No.", MachineRec."Fixed Asset Code");
                    FADepBook.SETRANGE("Depreciation Book Code", CompanyTextLbl);
                    if FADepBook.FINDFIRST() then begin
                        FAPostGrp := FADepBook."FA Posting Group";
                        FAPostGrpRec.SETRANGE(Code, FAPostGrp);
                        if FAPostGrpRec.FINDFIRST() then begin
                            GenJnl.VALIDATE(GenJnl."Bal. Account No.", FAPostGrpRec."Maintenance Expense Account");
                            GenJnl.INSERT(true);
                            RLineNo := RLineNo + 10000;
                        end;
                    end;
                end;
            until WorkSheetRec.NEXT() = 0;
        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJnl);
    end;

    local procedure VendorNoOnFormat();
    begin
        LineType2.RESET();
        LineType2.SETRANGE(Code, Rec."Line Type");
        if LineType2.FINDFIRST() then
            if LineType2.Service = true then
                "Vendor No.Editable" := true
            else
                "Vendor No.Editable" := false
    end;
}

