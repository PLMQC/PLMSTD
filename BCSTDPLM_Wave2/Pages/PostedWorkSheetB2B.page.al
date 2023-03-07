page 33000920 "Posted Work Sheet B2B"
{

    AutoSplitKey = true;
    Caption = 'Posted Work Sheet';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Work Sheet B2B";
    UsageCategory = History;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the job Card No.';
                    Visible = false;
                }
                field("Line Type Values"; Rec."Line Type Values")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the Line type Values.';
                }
                field("I/R Code"; Rec."I/R Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the I/R Code.';
                    Caption = 'No';
                }
                field("I/R Description"; Rec."I/R Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the Description.';
                    Caption = 'Description';
                }
                field("Time Required"; Rec."Time Required")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the Time Required.';
                    Caption = 'Hours Consumed';
                    Editable = "Time RequiredEditable";
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the Quantity.';
                    Editable = QuantityEditable;
                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the UOM.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the Unit Cost.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the Amount.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the Location code.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        TimeRequiredOnFormat();
        QuantityOnFormat();
    end;

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

    trigger OnInit();
    begin
        QuantityEditable := true;
        "Time RequiredEditable" := true;
    end;

    var
        JobCard: Record "PM Job Header B2B";
        WorkSheet: Record "Work Sheet B2B";
        LineTypeGrec: Record "Line Type B2B";
        [InDataSet]
        "Time RequiredEditable": Boolean;
        [InDataSet]
        QuantityEditable: Boolean;


    local procedure TimeRequiredOnFormat();
    begin
        LineTypeGrec.RESET();
        LineTypeGrec.SETRANGE(Code, Rec."Line Type");
        if LineTypeGrec.FINDFIRST() then
            if (LineTypeGrec."Resource Person") or (LineTypeGrec."Resource Equipment") then
                "Time RequiredEditable" := true
            else
                "Time RequiredEditable" := false;
    end;

    local procedure QuantityOnFormat();
    begin

        LineTypeGrec.RESET();
        LineTypeGrec.SETRANGE(Code, Rec."Line Type");
        if LineTypeGrec.FINDFIRST() then
            if (LineTypeGrec."Resource Person") or (LineTypeGrec."Resource Equipment") then
                QuantityEditable := false
            else
                QuantityEditable := true;
    end;
}

