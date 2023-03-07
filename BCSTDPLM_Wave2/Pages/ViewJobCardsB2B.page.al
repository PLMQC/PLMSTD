page 33000989 "View Job Cards B2B"
{

    Caption = 'PM Job Card';
    DeleteAllowed = true;
    Editable = false;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = "PM Job Header B2B";
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines No.';
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines machine ID.';
                }
                field("Equipment Name"; Rec."Machine Name")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine Name.';
                }
                field("Plant ID"; Rec."Plant ID")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Plant ID.';
                }
                field(Type; Rec.Type)
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Type.';
                    OptionCaption = 'PMR,BreakDown,Others,Predictive';
                }
                field("Start Date Time"; Rec."Start Date Time")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Start date and time.';
                }
                field("End Date Time"; Rec."End Date Time")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines End date and time.';
                }
                field("Time Duration"; Rec."Time Duration")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Time duration.';
                }
                field("Total Minutes"; Rec."Total Minutes")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Total minutes.';
                }
                field("Time(Hrs)"; Rec."Time(Hrs)")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines total Time in hours.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Department code.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Project code.';
                }
                field("Frequency Name"; Rec."Frequency Name")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Frequency .';
                }
                field(Maintenance; Rec."Maintenance Type")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Maintenance type.';
                }
                field(Status; Rec.Status)
                {
                    OptionCaption = 'Open,Released';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Status.';
                }
                field("Work Center"; Rec."Work Center")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Workcenter.';
                }
                field("Maintenance Unit"; Rec."Maintenance Unit")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Maintenance unit.';
                }
            }
            part(PMJobLine1; "PM Job Line B2B")
            {
                Caption = 'PMJobLine1';
                SubPageLink = "Job Header No." = FIELD("No."),
                              "Machine ID" = FIELD("Machine ID");
                ApplicationArea = ALL;
            }
            group(Details)
            {
                Caption = 'Details';
                field("Expected Resource Cost"; Rec."Expected Resource Cost")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Expected Resource Cost.';
                }
                field("Expected Spares Cost"; Rec."Expected Spares Cost")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Expected Spares Cost.';
                }
                field("Actual Resource Cost"; Rec."Actual Resource Cost")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Actual Resource Cost.';
                }
                field("Actual Spares Cost"; Rec."Actual Spares Cost")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Actual Spares Cost.';
                }
                field(WORKDATE; WORKDATE())
                {
                    Caption = 'Work Date';
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Workdate.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Created By.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Vendor No.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines vendor name.';
                }
                field("A.M.C"; Rec."A.M.C")
                {
                    OptionCaption = '" ,Yes,No"';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines AMC or not.';
                }
                field(Warranty; Rec.Warranty)
                {
                    OptionCaption = '" ,Yes,No"';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Warranty or not.';
                }
                field("Maintenance Date"; Rec."Maintenance Date")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Maintenance date.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(PMJob)
            {
                Caption = 'PM &Job';
                action("Planned Worksheet")
                {
                    Caption = 'Planned Worksheet';
                    Image = PlanningWorksheet;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Planning worksheet.';
                    RunObject = Page "PM Job OP Particulars B2B";
                    RunPageLink = "Job Card No." = FIELD("No.");
                }
                action("Work Sheet")
                {
                    Caption = 'Work Sheet';
                    Image = Worksheet;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Worksheet.';

                    trigger OnAction();
                    begin
                        Rec.TESTFIELD("Maintenance Type");
                        Rec.TESTFIELD(Status, Rec.Status::Released);
                        worksheet.RESET();
                        worksheet.SETRANGE("Job Card No.", Rec."No.");
                        worksheet.SETRANGE("Machine ID", Rec."Machine ID");
                        PAGE.RUN(33000916, worksheet);
                    end;
                }
                action(Comments)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines comments.';

                    trigger OnAction();
                    begin
                        CurrPage.PMJobLine1.PAGE.ShowComments();
                    end;
                }
                action("<Action1102154066>")
                {
                    Caption = 'Specs';
                    Image = Comment;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines specifications.';

                    trigger OnAction();
                    begin

                        CLEAR(EquipmentCheckForm);
                        EquipmentCheckList.SETRANGE(EquipmentCheckList."Machine ID", Rec."Machine ID");
                        EquipmentCheckList.SETRANGE(Type, EquipmentCheckList.Type::Specs);
                        EquipmentCheckForm.SetJobNo(Rec."No.");
                        EquipmentCheckForm.SETTABLEVIEW(EquipmentCheckList);
                        EquipmentCheckForm.RUNMODAL();
                    end;
                }
                group("Sub Contracting")
                {
                    Caption = 'Sub Contracting';
                    Image = ViewOrder;
                    action("<Action1102152006>")
                    {
                        Caption = 'Sub Contract &Work Sheet';
                        Image = Worksheet;
                        ApplicationArea = ALL;
                        ToolTip = 'It Defines subcontracting worksheet.';

                        trigger OnAction();
                        begin

                            SubconWorkSheet.RESET();
                            SubconWorkSheet.SETRANGE("Machine Id", Rec."Machine ID");
                            SubconWorkSheet.SETRANGE("Job Card No.", Rec."No.");
                            if SubconWorkSheet.FINDFIRST() then
                                if PurchHeader."No." = SubconWorkSheet."Purchase Order No." then begin
                                    PurchHeader.RESET();
                                    PurchHeader.SETRANGE("Machine Id B2B", SubconWorkSheet."Machine Id");
                                    PurchHeader.SETRANGE("Job Card No. B2B", SubconWorkSheet."Job Card No.");
                                    PAGE.RUN(33000897, SubconWorkSheet);
                                end
                                else
                                    ERROR('');
                        end;
                    }
                    action("Sub Contract &Order")
                    {
                        Caption = 'Sub Contract &Order';
                        Image = "Order";
                        ApplicationArea = ALL;
                        ToolTip = 'It Defines Subcontracting order.';

                        trigger OnAction();
                        begin

                            SubconWorkSheet.Reset();
                            SubconWorkSheet.SETRANGE("Machine Id", Rec."Machine ID");
                            SubconWorkSheet.SETRANGE("Job Card No.", Rec."No.");
                            if SubconWorkSheet.FINDFIRST() then
                                if PurchHeader."No." <> SubconWorkSheet."Purchase Order No." then begin
                                    PurchHeader.Reset();
                                    PurchHeader.SETRANGE("Machine Id B2B", SubconWorkSheet."Machine Id");
                                    PurchHeader.SETRANGE("Job Card No. B2B", SubconWorkSheet."Job Card No.");
                                    PAGE.RUN(0, PurchHeader);
                                end;
                        end;
                    }
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                action("Procedure")
                {
                    Caption = 'Procedure';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Procedure.';
                    Image = AddWatch;

                    trigger OnAction();
                    begin
                        CurrPage.PMJobLine1.PAGE.ShowJobLineProcedures();
                    end;
                }
                action("Safety Information")
                {
                    Caption = 'Safety Information';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines safety information.';
                    Image = Info;
                    RunObject = Page "Job Card Line Safety Info B2B";
                    RunPageLink = "Job Card No." = FIELD("No."),
                                  "Machine ID" = FIELD("Machine ID");
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Release Function.';
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin
                        Rec.ReleaseStatus();
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Reopen function.';

                    trigger OnAction();
                    begin
                        Rec.ReopenStatus();
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Ellipsis = true;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Posting Funtion.';
                    Image = Post;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        Rec.TESTFIELD(Status, Rec.Status::Released);
                        Rec.TESTFIELD("Start Date Time");
                        Rec.TESTFIELD("End Date Time");

                        Rec.CheckWorkSheet();

                        worksheet.RESET();
                        worksheet.SETRANGE("Job Card No.", Rec."No.");
                        if worksheet.FINDFIRST() then begin
                            if not worksheet.Posted then
                                ERROR(Text0005Lbl);
                        end else
                            ERROR(Text0006Lbl);



                        if not CONFIRM(Text001Lbl, false) then
                            exit;
                        if Rec."Time(Hrs)" < 0 then
                            ERROR(Text003Lbl);


                        Rec.PostEquipmentJournal(Rec);

                        Rec.Posted := true;
                        Rec."Posted Date" := WORKDATE();
                        Rec."Posted By" := Format(USERID());
                        Rec.MODIFY();
                        PMJobLine.SETRANGE("Job Header No.", Rec."No.");
                        if PMJobLine.FIND('-') then
                            repeat
                                PMJobLine.Posted := true;
                                PMJobLine.MODIFY();
                            until PMJobLine.NEXT() = 0;


                        BreakDownRec.SETRANGE("Complaint No.", Rec."Complaint No.");
                        if BreakDownRec.FINDFIRST() then begin
                            BreakDownRec."Job Card Posted" := true;
                            BreakDownRec.MODIFY();
                        end;

                        Rec.UpdateWorkSheet();

                        CurrPage.UPDATE();
                    end;
                }
            }
        }
    }

    var
        PMJobLine: Record "PM Job Line B2B";
        worksheet: Record "Work Sheet B2B";
        BreakDownRec: Record "Breakdown Records B2B";
        EquipmentCheckList: Record "Equipment Check List B2B";
        SubconWorkSheet: Record "SubCon WorkSheet B2B";
        PurchHeader: Record "Purchase Header";
        EquipmentCheckForm: Page "Equipment Check Lists (JC) B2B";
        Text001Lbl: Label 'Do you want post Job Card ?';
        Text003Lbl: Label 'End Time Should be greater than Start Time';
        Text0005Lbl: Label 'Work Sheet not posted.';
        Text0006Lbl: Label 'Work Sheet Empty.';
}

