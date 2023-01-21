package Shop_For_Home_C7_G3First_Microservice.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import Shop_For_Home_C7_G3First_Microservice.entity.WishList;

@Repository
public interface WishlistRepository extends JpaRepository<WishList, Integer>{
	Page<WishList> findAllByUserId(Long id, Pageable pageable);
}
