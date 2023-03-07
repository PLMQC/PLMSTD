page 33000978 "RunTimeFrequencySubform B2B"
{

    AutoSplitKey = true;
    Caption = 'RunTimeFrequencySubform';
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Runtime Frequency Line B2B";
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field(Type; Rec.Type)
                {
                    OptionCaption = '"  ,Variable,Fixed"';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Type.';

                    trigger OnValidate();
                    begin
                        RunTimeLine.RESET();
                        RunTimeLine.SETRANGE("Frequency Code", Rec."Frequency Code");
                        RunTimeLine.SETRANGE(Type, RunTimeLine.Type::Fixed);
                        if RunTimeLine.FINDFIRST() then
                            if (Rec.Type = Rec.Type::Fixed) then
                                ERROR(Text000Lbl);
                    end;
                }
                field("Min. Interval"; Rec."Min. Interval")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines MIn Interval.';
                }
                field("Max. Interval"; Rec."Max. Interval")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Max Interval.';

                    trigger OnValidate();
                    begin
                        if Rec."Job Card Created" = true then
                            ERROR(JobCardErr);
                    end;
                }
                field("Create Job Card"; Rec."Create Job Card")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Create Job card.';
                }
                field("Job Card Created"; Rec."Job Card Created")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Job card created.';
                }
                field(Period; Rec.Period)
                {
                    Editable = PeriodEdit;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Period.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        LineNo := 0;
        RunTimeLine.RESET();
        RunTimeLine.SETRANGE("Frequency Code", Rec."Frequency Code");
        RunTimeLine.SETRANGE(Type, RunTimeLine.Type::Fixed);
        if RunTimeLine.FINDFIRST() then begin
            LineNo := RunTimeLine."Line No.";
            if Rec."Line No." > LineNo then
                ERROR(Text000Lbl);
        end;
    end;

    var
        RunTimeLine: Record "Runtime Frequency Line B2B";
        Text000Lbl: Label 'You cannot enter a new record as type with Fixed is already enterd.';
        PeriodEdit: Boolean;
        LineNo: Integer;
        JobCardErr: Label 'We cant change "Max. Interval".Job card is already created';

    procedure EditablePeriod(JobcardOptions: Option "Run Time Based","Period And Runtime Based");
    begin

        if JobcardOptions = JobcardOptions::"Run Time Based" then
            PeriodEdit := false
        else
            PeriodEdit := true;
    end;
}

