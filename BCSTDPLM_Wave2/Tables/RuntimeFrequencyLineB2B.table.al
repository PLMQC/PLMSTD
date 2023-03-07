table 33000943 "Runtime Frequency Line B2B"
{

    Caption = 'Runtime Frequency Line';

    fields
    {
        field(1; "Frequency Code"; Code[20])
        {
            Caption = 'Frequency Code';
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(10; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = '"  ,Variable,Fixed"';
            OptionMembers = "  ",Variable,"Fixed";
            DataClassification = CustomerContent;
        }
        field(11; "Min. Interval"; Decimal)
        {
            Caption = 'Min. Interval';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(12; Period; DateFormula)
        {
            Caption = 'Period';
            DataClassification = CustomerContent;
        }
        field(13; "Max. Interval"; Decimal)
        {
            Caption = 'Max. Interval';
            DataClassification = CustomerContent;
        }
        field(15; "Create Job Card"; Boolean)
        {
            Caption = 'Create Job Card';
            DataClassification = CustomerContent;
        }
        field(17; "Job Card Created"; Boolean)
        {
            Caption = 'Job Card Created';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Frequency Code", "Line No.")
        {
        }
        key(Key2; "Min. Interval")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        TestStatus();
    end;

    trigger OnInsert();
    begin
        TestStatus();

        if RuntimeFrequency.GET("Frequency Code") then begin
            ;
            if ((RuntimeFrequency."Job Card Options" = RuntimeFrequency."Job Card Options"::"Period And Runtime Based")
               and (Type = Type::Variable)) then
                TESTFIELD(Period);
        end;

        CheckRunTimes();
    end;

    trigger OnModify();
    begin
        TestStatus();
    end;

    var
        RuntimeFrequency: Record "Runtime Frequency Header B2B";
        Text001Lbl: Label 'Max. Run Time (Hrs) is must be greater than Min. Run Time (Hrs).';

    procedure TestStatus();
    begin
        if RuntimeFrequency.GET("Frequency Code") then
            if RuntimeFrequency.Status = RuntimeFrequency.Status::Certified then
                RuntimeFrequency.FIELDERROR(Status);
    end;

    procedure CheckRunTimes();
    begin
        if "Min. Interval" > "Max. Interval" then
            ERROR(Text001Lbl);
    end;
}

