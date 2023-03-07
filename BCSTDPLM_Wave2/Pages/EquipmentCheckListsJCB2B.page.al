page 33000972 "Equipment Check Lists (JC) B2B"
{

    Caption = 'Equipment Check Lists (JC)';
    DelayedInsert = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Equipment Check List B2B";
    SourceTableView = SORTING("Machine ID", Code);
    UsageCategory = Documents;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Code"; Rec.Code)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Code.';
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Description.';
                }
                field(Type; Rec.Type)
                {
                    OptionCaption = '" ,Specs,CheckList"';
                    ApplicationArea = All;
                    ToolTip = 'It Defines type.';
                }
                field("User ID"; Rec."User ID")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines User ID.';
                }
                field(AfterMaintenance; Rec.AfterMaintenance)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Aftermaintenacne Checkmark.';
                }
                field("Before Maintenance"; Rec."Before Maintenance")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Before Maitenance.';
                    Visible = true;
                }
                field(Units; Rec.Units)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Units.';
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Time.';
                    Visible = false;
                }
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Job Card No.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Status.';
                    OptionCaption = '" ,Ok,Not Ok"';
                    Visible = true;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(FunctionMenu1)
            {
                Caption = 'F&unctions';
                action(Confirm)
                {
                    Caption = 'Confirm';
                    Image = Confirm;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Confirm function.';

                    trigger OnAction();
                    begin

                        MachineCheckList.RESET();
                        MachineCheckList.SETRANGE("Machine ID", Rec."Machine ID");
                        MachineCheckList.SETFILTER(Status, '<>%1', MachineCheckList.Status::" ");
                        if not MachineCheckList.FINDFIRST() then
                            ERROR(Text001Lbl);

                        MachineCheckList.RESET();
                        MachineCheckList.SETRANGE("Machine ID", Rec."Machine ID");
                        MachineCheckList.SETRANGE(Status, MachineCheckList.Status::" ");
                        if MachineCheckList.FINDFIRST() then
                            if not CONFIRM(Text002Lbl, true) then
                                ERROR('');
                        InsertHistoryDetails();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin

        Rec."Job Card No." := JobCardNo;
    end;

    var
        MachineCheckList: Record "Equipment Check List B2B";
        MachSpecsListHistory: Record "Equi. Specs List History B2B";
        Text001Lbl: Label 'Atleast one check list must be define.';
        Text002Lbl: Label 'One or more Checklists are pending. \Do you want to proceed ?';
        JobCardNo: Code[20];

    procedure SetJobNo(JobNo: Code[20]);
    begin

        JobCardNo := JobNo;
    end;

    procedure InsertHistoryDetails();
    begin
        MachineCheckList.RESET();
        MachineCheckList.SETRANGE("Machine ID", Rec."Machine ID");
        MachineCheckList.SETRANGE(Type, Rec.Type);
        if MachineCheckList.FINDFIRST() then
            repeat
                MachSpecsListHistory.INIT();
                MachSpecsListHistory.TRANSFERFIELDS(MachineCheckList);
                MachSpecsListHistory.Date := WORKDATE();
                MachSpecsListHistory.Time := Rec.Time;
                MachSpecsListHistory."User ID" := Format(USERID());
                MachSpecsListHistory.INSERT(true);


                MachineCheckList.VALIDATE(Status, MachineCheckList.Status::" ");
                MachineCheckList.MODIFY(true);
            until MachineCheckList.NEXT() = 0;
    end;
}

