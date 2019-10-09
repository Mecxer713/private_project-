<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Report_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
  
    public function get_income_report($academic_year_id, $group_by, $date_from, $date_to){
        
        $group_by_sql = '';
        $group_by_field = '';
       if($group_by && $group_by == 'income_head'){           
           $group_by_sql .= " GROUP BY H.title ORDER BY H.title ASC";
           $group_by_field .= ", H.title AS group_by_field";
           
       }elseif($group_by && $group_by == 'daily'){           
           $group_by_sql .= " GROUP BY T.payment_date ORDER BY T.payment_date ASC";
           $group_by_field .= ", DATE_FORMAT(T.payment_date, '%b %d, %Y') AS group_by_field";
           
       }elseif($group_by && $group_by == 'monthly'){           
           $group_by_sql .= " GROUP BY MONTH(T.payment_date), YEAR(I.date) ORDER BY I.date ASC";
           $group_by_field .= ", DATE_FORMAT(T.payment_date, '%M, %Y') AS group_by_field";
           
       }elseif($group_by && $group_by == 'yearly'){           
           $group_by_sql .= " GROUP BY I.academic_year_id ORDER BY I.academic_year_id ASC";
           $group_by_field .= ", DATE_FORMAT(T.payment_date, '%Y') AS group_by_field";
           
       }elseif($group_by && $group_by == 'income_by'){           
           $group_by_sql .= " GROUP BY T.payment_method ORDER BY T.payment_method ASC";
           $group_by_field .= ", T.payment_method AS group_by_field";
           
       } 
       
        $sql = "SELECT I.*, SUM(I.net_amount) AS total_amount, T.payment_date, H.title AS head, AY.session_year $group_by_field 
                FROM invoices AS I 
                LEFT JOIN income_heads AS H ON H.id = I.income_head_id 
                LEFT JOIN transactions AS T ON T.invoice_id = I.id 
                LEFT JOIN academic_years AS AY ON AY.id = I.academic_year_id 
                WHERE I.status = 1 ";
       if($date_from != '' && $date_to != ''){
           $sql .= " AND I.date >= '$date_from' AND I.date <= '$date_to' ";
       }
       if($date_from != '' && $date_to == ''){
           $sql .= "I.date >= '$date_from'";
       }
       if($academic_year_id){
           $sql .= " AND I.academic_year_id = '$academic_year_id'";
       }
       
       
       $sql .= $group_by_sql;
        
       return $this->db->query($sql)->result();
    }
    
  
    public function get_expenditure_report($academic_year_id, $group_by, $date_from, $date_to){
        
        $group_by_sql = '';
        $group_by_field = '';
       if($group_by && $group_by == 'expenditure_head'){           
           $group_by_sql .= " GROUP BY H.title ORDER BY H.title ASC";
           $group_by_field .= ", H.title AS group_by_field";
       }elseif($group_by && $group_by == 'daily'){           
           $group_by_sql .= " GROUP BY E.date ORDER BY E.date ASC";
           $group_by_field .= ", DATE_FORMAT(E.date, '%b %d, %Y') AS group_by_field";
       }elseif($group_by && $group_by == 'monthly'){           
           $group_by_sql .= " GROUP BY MONTH(E.date), YEAR(E.date) ORDER BY E.date ASC";
           $group_by_field .= ", DATE_FORMAT(E.date, '%M, %Y') AS group_by_field";
       }elseif($group_by && $group_by == 'yearly'){           
           $group_by_sql .= " GROUP BY E.academic_year_id ORDER BY E.academic_year_id ASC";
           $group_by_field .= ", DATE_FORMAT(E.date, '%Y') AS group_by_field";
       }elseif($group_by && $group_by == 'expenditure_by'){           
           $group_by_sql .= " GROUP BY E.expenditure_via ORDER BY E.expenditure_via ASC";
           $group_by_field .= ", E.expenditure_via AS group_by_field";
       } 
       
        $sql = "SELECT E.*, SUM(E.amount) AS total_amount, H.title AS head, AY.session_year $group_by_field 
                FROM expenditures AS E 
                LEFT JOIN expenditure_heads AS H ON H.id = E.expenditure_head_id 
                LEFT JOIN academic_years AS AY ON AY.id = E.academic_year_id 
                WHERE E.status = 1 ";
       if($date_from != '' && $date_to != ''){
           $sql .= " AND E.date >= '$date_from' AND E.date <= '$date_to' ";
       }
       if($date_from != '' && $date_to == ''){
           $sql .= "E.date >= '$date_from'";
       }
       if($academic_year_id){
           $sql .= " AND E.academic_year_id = '$academic_year_id'";
       }
       
       
       $sql .= $group_by_sql;
        
       return $this->db->query($sql)->result();
    }
    
    public function get_invoice_report($academic_year_id, $group_by, $date_from, $date_to){
        
        $group_by_sql = '';
        $group_by_field = '';
        
       if($group_by && $group_by == 'fee_head'){           
           $group_by_sql .= " GROUP BY H.title ORDER BY H.title ASC";
           $group_by_field .= ", H.title AS group_by_field";
           
       }elseif($group_by && $group_by == 'daily'){           
           $group_by_sql .= " GROUP BY I.date ORDER BY I.date ASC";
           $group_by_field .= ", DATE_FORMAT(I.date, '%b %d, %Y') AS group_by_field";
           
       }elseif($group_by && $group_by == 'monthly'){           
           $group_by_sql .= " GROUP BY MONTH(I.date), YEAR(I.date) ORDER BY I.date ASC";
           $group_by_field .= ", DATE_FORMAT(I.date, '%b, %Y') AS group_by_field";
           
       }elseif($group_by && $group_by == 'yearly'){           
           $group_by_sql .= " GROUP BY I.academic_year_id ORDER BY I.academic_year_id ASC";
           $group_by_field .= ", DATE_FORMAT(I.date, '%Y') AS group_by_field";
           
       }elseif($group_by && $group_by == 'class'){           
           $group_by_sql .= " GROUP BY I.class_id ORDER BY I.class_id ASC";
           $group_by_field .= ", C.name AS group_by_field";
           
       }elseif($group_by && $group_by == 'paid_status'){           
           $group_by_sql .= " GROUP BY I.paid_status ORDER BY I.paid_status ASC";
           $group_by_field .= ", I.paid_status AS group_by_field";
       } 
       
        $sql = "SELECT I.*, SUM(I.net_amount) AS total_amount, SUM(I.discount) AS total_discount, H.title AS head, AY.session_year $group_by_field 
                FROM invoices AS I
                LEFT JOIN income_heads AS H ON H.id = I.income_head_id 
                LEFT JOIN academic_years AS AY ON AY.id = I.academic_year_id 
                LEFT JOIN classes AS C ON C.id = I.class_id 
                WHERE I.status = 1";
        
       if($date_from != '' && $date_to != ''){
           $sql .= " AND I.date >= '$date_from' AND I.date <= '$date_to' ";
       }
       if($date_from != '' && $date_to == ''){
           $sql .= "I.date >= '$date_from'";
       }
       if($academic_year_id){
           $sql .= " AND I.academic_year_id = '$academic_year_id'";
       }
       
       
       $sql .= $group_by_sql;
        
       return $this->db->query($sql)->result();
    }
    
    public function get_expenditure_by_date($date){
        $sql = "SELECT  SUM(E.amount) AS total_amount
                FROM expenditures AS E                
                WHERE E.date = '$date' GROUP BY E.date ASC";
        
        $exp = $this->db->query($sql)->row();
        return isset($exp->total_amount) ? $exp->total_amount: 0;
    }
           
    public function get_income_by_date($date){
        
        $sql = "SELECT  SUM(I.net_amount) AS total_amount
                FROM invoices AS I                
                WHERE I.date = '$date' GROUP BY I.date ASC";
        
        $income= $this->db->query($sql)->row();
        return isset($income->total_amount) ? $income->total_amount: 0;
    }
    
    
      public function get_library_report($academic_year_id, $group_by, $date_from, $date_to){
        
        $group_by_sql = '';
        $group_by_field = '';
       if($group_by && $group_by == 'daily'){           
           $group_by_sql .= " GROUP BY BI.issue_date ORDER BY BI.issue_date ASC";
           $group_by_field .= ", DATE_FORMAT(BI.issue_date, '%b %d, %Y') AS group_by_field";
           
       }elseif($group_by && $group_by == 'monthly'){           
           $group_by_sql .= " GROUP BY MONTH(BI.issue_date), YEAR(BI.issue_date) ORDER BY BI.issue_date ASC";
           $group_by_field .= ", DATE_FORMAT(BI.issue_date, '%M, %Y') AS group_by_field";
           
       }elseif($group_by && $group_by == 'yearly'){           
           $group_by_sql .= " GROUP BY BI.academic_year_id ORDER BY BI.academic_year_id ASC";
           $group_by_field .= ", DATE_FORMAT(BI.issue_date, '%Y') AS group_by_field";
           
       }elseif($group_by && $group_by == 'class'){           
           $group_by_sql .= " GROUP BY C.name ORDER BY C.name ASC";
           $group_by_field .= ", C.name AS group_by_field";
           
       } 
       
        $sql = "SELECT BI.*, COUNT(BI.id) AS total_issue, SUM(BI.is_returned) AS total_returned, AY.session_year $group_by_field 
                FROM book_issues AS BI 
                LEFT JOIN library_members AS LM ON LM.id = BI.library_member_id 
                LEFT JOIN students AS S ON S.user_id = LM.user_id 
                LEFT JOIN enrollments AS E ON E.student_id = S.id 
                LEFT JOIN classes AS C ON C.id = E.class_id 
                LEFT JOIN academic_years AS AY ON AY.id = BI.academic_year_id 
                WHERE BI.status = 1 ";
        
       if($date_from != '' && $date_to != ''){
           $sql .= " AND BI.issue_date >= '$date_from' AND BI.return_date <= '$date_to' ";
       }
       if($date_from != '' && $date_to == ''){
           $sql .= "BI.issue_date >= '$date_from'";
       }
       if($academic_year_id){
           $sql .= " AND BI.academic_year_id = '$academic_year_id'";
       }
       
       if(!$academic_year_id){
           $sql .= " AND E.academic_year_id = '$this->academic_year_id'";
       }
       
       
       $sql .= $group_by_sql;
        
       return $this->db->query($sql)->result();
    }
  
     public function get_student_list($academic_year_id, $class_id, $section_id){
         
        $this->db->select('E.roll_no,  S.id, S.name');
        $this->db->from('enrollments AS E');        
        $this->db->join('students AS S', 'S.id = E.student_id', 'left');
        $this->db->where('E.academic_year_id', $academic_year_id);       
        $this->db->where('E.class_id', $class_id);       
        $this->db->where('E.section_id', $section_id);       
        return $this->db->get()->result();    
    } 
    
    
    public function get_student_report($academic_year_id, $group_by){
        
        $group_by_sql = '';
        $group_by_field = '';
        $sql_plus = '';
        
       if($group_by && $group_by == 'gender'){           
           $group_by_sql .= " GROUP BY C.name ORDER BY C.id ASC";
           $group_by_field .= ", C.name AS group_by_field";
           
       }elseif($group_by && $group_by == 'vehicle'){           
           $group_by_sql .= " GROUP BY C.name ORDER BY C.id ASC";
           $group_by_field .= ", C.name AS group_by_field";
           $sql_plus .= " AND S.is_transport_member = '1'";
           
       }elseif($group_by && $group_by == 'library'){           
           $group_by_sql .= " GROUP BY C.name ORDER BY C.id ASC";
           $group_by_field .= ", C.name AS group_by_field";
           $sql_plus .= " AND S.is_library_member = '1'";
           
       }elseif($group_by && $group_by == 'hostel'){           
           $group_by_sql .= " GROUP BY C.name ORDER BY C.id ASC";
           $group_by_field .= ", C.name AS group_by_field";
           $sql_plus .= " AND S.is_hostel_member = '1'";
           
       }elseif($group_by && $group_by == 'class'){           
           $group_by_sql .= " GROUP BY C.name ORDER BY C.id ASC";
           $group_by_field .= ", C.name AS group_by_field";
       } 
       
        $sql = "SELECT S.id, COUNT(S.id) AS total, C.id as class_id, E.class_id, E.academic_year_id, AY.session_year $group_by_field 
                FROM students AS S 
                LEFT JOIN enrollments AS E ON E.student_id = S.id 
                LEFT JOIN classes AS C ON C.id = E.class_id 
                LEFT JOIN academic_years AS AY ON AY.id = E.academic_year_id 
                WHERE S.status = 1 ";
             
       if($academic_year_id){
           $sql_plus .= " AND E.academic_year_id = '$academic_year_id'";
       }
       
       $sql .= $sql_plus;
       $sql .= $group_by_sql;
        
       return $this->db->query($sql)->result();
    }
    
    public function get_student_by_gender($class_id, $academic_year_id, $gender){
        
        $sql = "SELECT COUNT(S.id) AS total
                FROM students AS S 
                LEFT JOIN enrollments AS E ON E.student_id = S.id 
                LEFT JOIN classes AS C ON C.id = E.class_id 
                WHERE S.gender = '$gender' AND E.class_id = $class_id AND E.academic_year_id = '$academic_year_id'";
         return $this->db->query($sql)->row()->total;
    }
    
    
    public function get_payroll_report($academic_year_id, $group_by, $payment_to, $user_id, $month){
        
        $group_by_sql = '';
        $group_by_field = '';
        
       if($group_by && $group_by == 'salary_type'){           
           $group_by_sql .= " GROUP BY SP.salary_type ORDER BY SP.salary_type ASC";
           $group_by_field .= ", SP.salary_type AS group_by_field";
       }elseif($group_by && $group_by == 'payment_to'){           
           $group_by_sql .= " GROUP BY SP.payment_to ORDER BY SP.payment_to ASC";
           $group_by_field .= ", SP.payment_to AS group_by_field";
           $group_by_field .= ", SP.payment_to AS group_by_field";
       }elseif($group_by && $group_by == 'month'){           
           $group_by_sql .= " GROUP BY SP.salary_month ORDER BY SP.salary_month ASC";
           $group_by_field .= ", SP.salary_month AS group_by_field";
       }elseif($group_by && $group_by == 'yearly'){           
           $group_by_sql .= " GROUP BY SP.academic_year_id ORDER BY SP.academic_year_id ASC";
           $group_by_field .= ", DATE_FORMAT(SP.salary_month, '%Y') AS group_by_field";
       }elseif($group_by && $group_by == 'expenditure_by'){           
           $group_by_sql .= " GROUP BY SP.payment_method ORDER BY SP.payment_method ASC";
           $group_by_field .= ", SP.payment_method AS group_by_field";
       } 
       
        $sql = "SELECT SP.id, SUM(SP.net_salary) AS total_amount, AY.session_year $group_by_field
                FROM salary_payments AS SP 
                LEFT JOIN academic_years AS AY ON AY.id = SP.academic_year_id 
                WHERE SP.status = 1 ";
                  
       if($academic_year_id){
           $sql .= " AND SP.academic_year_id = '$academic_year_id'";
       }       
       if($month){
           $sql .= " AND SP.salary_month = '$month'";
       }
       
       
       $sql .= $group_by_sql;
        
       return $this->db->query($sql)->result();
    }
    
    
    public function get_debit_by_date($date){
        
        $this->db->select('E.amount AS debit, E.note, E.note, H.title AS head');
        $this->db->from('expenditures AS E');        
        $this->db->join('expenditure_heads AS H', 'H.id = E.expenditure_head_id', 'left');
        $this->db->where('E.date', $date); 
        return $this->db->get()->result();       
    }
           
    public function get_credit_by_date($date){
        
        $this->db->select('T.amount as credit, T.payment_date, T.note, IH.title AS head');
        $this->db->from('transactions AS T');   
        $this->db->join('invoices AS I', 'I.id = T.invoice_id', 'left');
        $this->db->join('income_heads AS IH', 'IH.id = I.income_head_id', 'left');
        $this->db->where('T.payment_date', $date);              
        return $data = $this->db->get()->result();   
               
    }   
    
    
    public function get_transaction_report($academic_year_id, $date_from, $date_to){
        
        $this->db->select('T.*, T.note, IH.title AS head, AY.session_year');
        $this->db->from('transactions AS T');   
        $this->db->join('invoices AS I', 'I.id = T.invoice_id', 'left');
        $this->db->join('income_heads AS IH', 'IH.id = I.income_head_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = T.academic_year_id', 'left');
        
        if($date_from != '' && $date_to != ''){
           $this->db->where('T.payment_date >=', $date_from);
           $this->db->where('T.payment_date <=', $date_to);
        }      
        
        if($date_from != '' && $date_to == ''){
           $this->db->where('T.payment_date >=', $date_from);
        }
       
        if($academic_year_id){
            $this->db->where('T.academic_year_id', $academic_year_id);
        }       
        if(!$academic_year_id){
            $this->db->where('T.academic_year_id', $this->academic_year_id);
        }        
              
        return $this->db->get()->result();   
       
    }    
  
    
    public function get_student_activity_report($academic_year_id, $class_id, $student_id){
        
        $this->db->select('SA.*, C.name AS class_name, ST.name, S.name AS section, AY.session_year');
        $this->db->from('student_activities AS SA');   
        $this->db->join('students AS ST', 'ST.id = SA.student_id', 'left');
        $this->db->join('classes AS C', 'C.id = SA.class_id', 'left');
        $this->db->join('sections AS S', 'S.id = SA.section_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = SA.academic_year_id', 'left');
        
        if($class_id != ''){
           $this->db->where('SA.class_id', $class_id);
        }      
        
        if($student_id != ''){
           $this->db->where('SA.student_id', $student_id);
        }
       
        if($academic_year_id){
            $this->db->where('SA.academic_year_id', $academic_year_id);
        }       
        if(!$academic_year_id){
            $this->db->where('SA.academic_year_id', $this->academic_year_id);
        }        
              
        return $this->db->get()->result();   
       
    }    
  
    public function get_student_invoice_report($academic_year_id, $class_id, $student_id){
        
        $this->db->select('I.*, SUM(T.amount) AS paid_amount, IH.title AS head, C.name AS class_name, ST.name AS student,  AY.session_year');
        $this->db->from('invoices AS I');   
        $this->db->join('transactions AS T', 'T.invoice_id = I.id', 'left');
        $this->db->join('students AS ST', 'ST.id = I.student_id', 'left');
        $this->db->join('classes AS C', 'C.id = I.class_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = I.academic_year_id', 'left');
        $this->db->join('income_heads AS IH', 'IH.id = I.income_head_id', 'left');
        
        if($class_id != ''){
           $this->db->where('I.class_id', $class_id);
        }      
        
        if($student_id != ''){
           $this->db->where('I.student_id', $student_id);
        }
       
        if($academic_year_id){
            $this->db->where('I.academic_year_id', $academic_year_id);
        }       
        if(!$academic_year_id){
            $this->db->where('I.academic_year_id', $this->academic_year_id);
        }
        $this->db->group_by('I.id', 'DESC'); 
              
        return $this->db->get()->result();  
        // echo $this->db->last_query();
       
    }    
  
  
    public function get_student_due_fee_report($academic_year_id, $class_id, $student_id){
        
        $this->db->select('I.*, SUM(T.amount) AS paid_amount, IH.title AS head, C.name AS class_name, ST.name AS student,  AY.session_year');
        $this->db->from('invoices AS I');   
        $this->db->join('transactions AS T', 'T.invoice_id = I.id', 'left');
        $this->db->join('students AS ST', 'ST.id = I.student_id', 'left');
        $this->db->join('classes AS C', 'C.id = I.class_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = I.academic_year_id', 'left');
        $this->db->join('income_heads AS IH', 'IH.id = I.income_head_id', 'left');
        
        if($class_id != ''){
           $this->db->where('I.class_id', $class_id);
        }      
        
        if($student_id != ''){
           $this->db->where('I.student_id', $student_id);
        }
       
        if($academic_year_id){
            $this->db->where('I.academic_year_id', $academic_year_id);
        }       
        if(!$academic_year_id){
            $this->db->where('I.academic_year_id', $this->academic_year_id);
        }
        
        $this->db->where('I.paid_status !=', 'paid');
        $this->db->group_by('I.id', 'DESC'); 
              
        return $this->db->get()->result();  
        // echo $this->db->last_query();
       
    }  
    
    public function get_student_fee_collection_report($academic_year_id, $class_id, $student_id, $fee_type, $date_from, $date_to){
        
        $this->db->select('T.*, T.note,ST.name AS student, C.name AS class_name, IH.title AS head, AY.session_year');
        $this->db->from('transactions AS T');   
        $this->db->join('invoices AS I', 'I.id = T.invoice_id', 'left');
        $this->db->join('students AS ST', 'ST.id = I.student_id', 'left');
        $this->db->join('classes AS C', 'C.id = I.class_id', 'left');
        $this->db->join('income_heads AS IH', 'IH.id = I.income_head_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = T.academic_year_id', 'left');
        
        if($date_from != '' && $date_to != ''){
           $this->db->where('T.payment_date >=', $date_from);
           $this->db->where('T.payment_date <=', $date_to);
        }      
        
        if($date_from != '' && $date_to == ''){
           $this->db->where('T.payment_date >=', $date_from);
        }
       
        if($academic_year_id){
            $this->db->where('T.academic_year_id', $academic_year_id);
        }       
        if(!$academic_year_id){
            $this->db->where('T.academic_year_id', $this->academic_year_id);
        } 
        if($class_id != ''){
           $this->db->where('I.class_id', $class_id);
        } 
        if($student_id != ''){
           $this->db->where('I.student_id', $student_id);
        }
        if($fee_type != ''){
           $this->db->where('I.income_head_id', $fee_type);
        }        
              
        return $this->db->get()->result();   
       
    }    
  
  
    public function get_student_examresult_report($academic_year_id, $class_id, $section_id){
        
        $this->db->select('FR.*, G.name AS grade, E.roll_no, ST.name AS student, C.name AS class_name, S.name AS section, AY.session_year');
        $this->db->from('final_results AS FR');   
        $this->db->join('enrollments AS E', 'E.student_id = FR.student_id', 'left');
        $this->db->join('students AS ST', 'ST.id = E.student_id', 'left');
        $this->db->join('classes AS C', 'C.id = E.class_id', 'left');
        $this->db->join('sections AS S', 'S.id = E.section_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = E.academic_year_id', 'left');
        $this->db->join('grades AS G', 'G.id = FR.grade_id', 'left');
               
       
        if($academic_year_id){
            $this->db->where('E.academic_year_id', $academic_year_id);
        }       
        if(!$academic_year_id){
            $this->db->where('E.academic_year_id', $this->academic_year_id);
        } 
        if($class_id != ''){
           $this->db->where('E.class_id', $class_id);
        } 
        if($section_id != ''){
           $this->db->where('E.section_id', $section_id);
        } 
        
         $this->db->order_by('FR.avg_grade_point', 'DESC');
              
        return $this->db->get()->result();   
       
    }    
  
  
}
