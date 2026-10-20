package org.example.controller;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api")
public class ApiController {
    private final MemberRepository memberRepository;
    public ApiController(MemberRepository memberRepository) { this.memberRepository = memberRepository; }



    @GetMapping("/hello1")
    public List<Member> getMembers() { return memberRepository.findAll(); }

    @PostMapping("/join")
    public Member joinMember(@RequestParam String name) { return memberRepository.save(new Member(name)); }
}
