table 33000931 "Equipment Check List B2B"
{

    Caption = 'Equipment Check List';
    DrillDownPageID = "Equipment Check List B2B";
    LookupPageID = "Equipment Check List B2B";
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Machine ID"; Code[20])
        {
            Caption = 'Machine ID';
            TableRelation = "Equipment B2B"."No.";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CLEAR("Machine Name");
                Machine.GET("Machine ID");
                "Machine Name" := Machine.Name
            end;
        }
        field(2; "Machine Name"; Text[50])
        {
            Caption = 'Machine Name';
            DataClassification = CustomerContent;
        }
        field(3; "Code"; Code[20])
        {
            Caption = 'Code';
            Editable = false;
            TableRelation = "Check List Parameters B2B".Code;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CLEAR(Description);
                PLMChecklist.GET(Code);
                Description := PLMChecklist.Description;
                Frequency := PLMChecklist.Interval;
                "Time Interval" := PLMChecklist."Time Interval";
            end;
        }
        field(4; Description; Text[250])
        {
            Caption = 'Description';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(5; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = '" ,Ok,Not Ok"';
            DataClassification = CustomerContent;
            OptionMembers = " ",Ok,"Not Ok";
        }
        field(6; Date; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(7; "Last Modified Date"; Date)
        {
            Caption = 'Last Modified Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(8; "Check List No."; Code[10])
        {
            Caption = 'Check List No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(9; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
        field(10; Time; Time)
        {
            Caption = 'Time';
            DataClassification = CustomerContent;
        }
        field(15; Type; Option)
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
            OptionCaption = '" ,Specs,CheckList"';
            OptionMembers = " ",Specs,CheckList;
        }
        field(20; "Before Maintenance"; Code[20])
        {
            Caption = 'Before Maintenance';
            DataClassification = CustomerContent;
        }
        field(22; AfterMaintenance; Code[20])
        {
            Caption = 'AfterMaintenance';
            DataClassification = CustomerContent;
        }
        field(25; Units; Code[20])
        {
            Caption = 'Units';
            DataClassification = CustomerContent;
        }
        field(26; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = CustomerContent;
        }
        field(27; Frequency; Code[20])
        {
            Caption = 'Frequency';
            DataClassification = CustomerContent;
        }
        field(28; "Time Interval"; DateFormula)
        {
            Caption = 'Time Interval';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Machine ID", "Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Machine: Record "Equipment B2B";
        MachCheckListHistory: Record "Equi. Check List History B2B";
        MachineCheckList: Record "Equipment Check List B2B";
        PLMChecklist: Record "Check List Parameters B2B";
        Text001Lbl: Label 'Atleast one check list must be define.';
        Text002Lbl: Label 'One or more Checklists are pending. \Do you want to proceed ?';

    procedure ConfirmCheckList();
    begin
        MachineCheckList.RESET();
        MachineCheckList.SETRANGE("Machine ID", "Machine ID");
        MachineCheckList.SETFILTER(Status, '<>%1', MachineCheckList.Status::" ");
        if not MachineCheckList.FINDFIRST() then
            ERROR(Text001Lbl);

        MachineCheckList.RESET();
        MachineCheckList.SETRANGE("Machine ID", "Machine ID");
        MachineCheckList.SETRANGE(Status, MachineCheckList.Status::" ");
        if MachineCheckList.FINDFIRST() then
            if not CONFIRM(Text002Lbl, true) then
                ERROR('');
        InsertValues();
    end;

    procedure InsertValues();
    begin
        MachineCheckList.RESET();
        MachineCheckList.SETRANGE("Machine ID", "Machine ID");
        if MachineCheckList.FINDFIRST() then
            repeat
                MachCheckListHistory.INIT();
                MachCheckListHistory.TRANSFERFIELDS(MachineCheckList);
                MachCheckListHistory.Date := WORKDATE();
                MachCheckListHistory.Time := Time;
                MachCheckListHistory."User ID" := Format(UserId());
                MachCheckListHistory.INSERT(true);
                MachineCheckList.VALIDATE(Status, MachineCheckList.Status::" ");
                MachineCheckList.MODIFY(true);
            until MachineCheckList.NEXT() = 0;
    end;
}

