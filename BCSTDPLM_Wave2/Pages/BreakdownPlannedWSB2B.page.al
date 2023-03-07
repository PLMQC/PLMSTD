page 33000971 "Breakdown Planned WS B2B"
{

    AutoSplitKey = true;
    Caption = 'Breakdown Planned Worksheet';
    Editable = true;
    PageType = Worksheet;
    SourceTable = "PM Job OP Particulars B2B";
    SourceTableView = SORTING(ID, "ScheduleTemplate ID", "Line No.");
    UsageCategory = Documents;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines ID.';
                    Visible = false;
                }
                field("ScheduleTemplate ID"; Rec."ScheduleTemplate ID")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Schedule template ID.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    Visible = true;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Line type.';

                    trigger OnValidate();
                    begin
                        EditableFields();
                    end;
                }
                field("Line Type Name"; Rec."Line Type Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Line Name.';
                }
                field("Sl. No."; Rec."Sl. No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Sl no.';
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Line No.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Serial No.';
                }
                field("I/R Code"; Rec."I/R Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines I/R Code.';
                }
                field("I/R Description"; Rec."I/R Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines I/R Code Description.';
                }
                field("Time Required"; Rec."Time Required")
                {
                    Editable = "Time RequiredEditable";
                    ApplicationArea = All;
                    ToolTip = 'It Defines Time required.';
                }
                field(Quantity; Rec.Quantity)
                {
                    Editable = QuantityEditable;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Qunatity.';
                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines UOM.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Unit Cost.';
                }
                field("Job Card No."; Rec."Job Card No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Job Card Number.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Amount.';
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Machine ID.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        //OnAfterGetCurrRecord;
    end;

    trigger OnClosePage();
    begin

        PMJobLineRec.RESET();
        PMJobLineRec.SETRANGE(PMJobLineRec."Job Header No.", Rec."Job Card No.");
        if Rec.FINDSET() then
            repeat
                TotalCost += Rec.Amount;
            until Rec.NEXT() = 0;
        PMJobLineRec.MODIFYALL(PMJobLineRec."Planned Total Cost", TotalCost, true);
    end;

    trigger OnInit();
    begin
        QuantityEditable := true;
        "Time RequiredEditable" := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin

        Rec."Job Card No." := JobNo;
        Rec."Machine ID" := Machine;
        Rec."PM Line No." := Line;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin

        Rec."Job Card No." := JobNo;
        Rec."Machine ID" := Machine;
        Rec."PM Line No." := Line;
        //OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage();
    begin
        Rec."Job Card No." := JobNo;
        Rec."Machine ID" := Machine;
        Rec."PM Line No." := Line;
        PMJobHeader.RESET();
        PMJobHeader.SETRANGE("No.", Rec."Job Card No.");
        PMJobHeader.SETRANGE("Machine ID", Rec."Machine ID");
        if PMJobHeader.FINDFIRST() then
            if PMJobHeader.Status = PMJobHeader.Status::Released then;
    end;

    var
        PMJobLineRec: Record "PM Job Line B2B";
        PMJobHeader: Record "PM Job Header B2B";
        LineType: Record "Line Type B2B";
        JobNo: Code[20];
        TotalCost: Decimal;
        Machine: Code[20];
        Line: Integer;

        [InDataSet]
        "Time RequiredEditable": Boolean;
        [InDataSet]
        QuantityEditable: Boolean;


    procedure EditableFields();
    begin

        LineType.RESET();
        LineType.SETRANGE(Code, Rec."Line Type");
        if LineType.FINDFIRST() then begin
            if (LineType."Resource Person") or (LineType."Resource Equipment") then begin
                "Time RequiredEditable" := true;
                QuantityEditable := true;
            end else
                "Time RequiredEditable" := false;
            QuantityEditable := true;
        end;
    end;

    procedure SetJobNo(JobCardNo: Code[20]; MachineId: Code[20]; LineNo: Integer);
    begin

        JobNo := JobCardNo;
        Machine := MachineId;
        Line := LineNo;
    end;

    /*
        local procedure OnAfterGetCurrRecord();
        begin
            xRec := Rec;
            EditableFields();
        end;
        */
}

